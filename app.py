from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
from datetime import datetime

app = Flask(__name__)
app.secret_key = 'secret_key'  # Necessário para usar sessões

# Configurações do MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="gerenciamento_asilo"
)
cursor = db.cursor()

@app.context_processor
def inject_now():
    return {'datetime': datetime.now()}

# Rota para a página inicial
@app.route('/')
def index():
    return redirect(url_for('login'))  # Redireciona para a página de login

# Página de Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario_input = request.form.get('usuario')  # Use 'get' para evitar KeyError
        senha = request.form.get('senha')

        # Consultar o banco de dados para verificar o login
        cursor.execute("SELECT nome, id, tipo FROM usuario WHERE usuario = %s AND senha = %s", (usuario_input, senha))
        usuario = cursor.fetchone()

        if usuario:  # Verifica se o usuário foi encontrado
            session['usuario'] = usuario[0]  # 'nome' é o primeiro campo retornado
            session['usuario_id'] = usuario[1]  # 'id' é o segundo campo retornado
            session['tipo_usuario'] = usuario[2]  # 'tipo' é o terceiro campo retornado
            print(f"Usuário logado: {session['usuario']} (Tipo: {session['tipo_usuario']})")  # Debugging
            
            # Redirecionar com base no tipo de usuário
            if session['tipo_usuario'] == 'admin':
                return redirect(url_for('admin_dashboard'))
            elif session['tipo_usuario'] == 'medico':
                return redirect(url_for('medico_dashboard'))
            else:
                return "<h1>Tipo de usuário não reconhecido. Acesso negado.</h1><a href='/login'>Voltar ao login</a>"
        else:
            return "<h1>Login inválido. Tente novamente.</h1><a href='/login'>Voltar ao login</a>"

    return render_template('login.html')

@app.route("/admin_dashboard")
def admin_dashboard():
    # Verifica se o usuário logado é o admin1
    is_admin = session.get('usuario') == 'admin1'
    print(f"É admin: {is_admin}")  # Debugging
    # Passa a informação para o template
    return render_template("admin_dashboard.html", usuario=session.get('usuario'), usuario_id=session.get('usuario_id'), is_admin=is_admin)

@app.route('/medico_dashboard')
def medico_dashboard():
    # Aqui você deve obter o nome e o ID do usuário logado a partir da sessão
    nome = session.get('usuario')  # 'usuario' contém o nome do usuário
    usuario_id = session.get('usuario_id')  # 'usuario_id' contém o ID do usuário

    # Você pode precisar da data e hora atual
    from datetime import datetime
    data_hora_atual = datetime.now()

    return render_template('medico_dashboard.html', nome=nome, id=usuario_id, datetime=data_hora_atual)

# Rota para cadastrar usuários
@app.route("/cadastrar_usuario", methods=["GET", "POST"])
def cadastrar_usuario():
    if request.method == "POST":
        tipo_usuario = request.form["tipo_usuario"]
        usuario = request.form["usuario"]
        senha = request.form["senha"]  # Captura a senha
        nome_completo = request.form["nome_completo"]
        telefone = request.form["telefone"]
        endereco = request.form["endereco"]
        idade = request.form["idade"]
        curriculo = request.files.get("curriculo")  # Usar get para evitar KeyError
        
        # Salva o currículo se um arquivo foi enviado
        curriculo_path = ""
        if curriculo:
            curriculo_path = f"uploads/{curriculo.filename}"
            curriculo.save(curriculo_path)  # Salva o arquivo na pasta uploads

        # Insere o novo usuário no banco de dados
        if tipo_usuario == "medico":
            numero_crm = request.form["numero_crm"]
            cursor.execute("""INSERT INTO usuario (tipo, usuario, senha, nome_completo, telefone, endereco, idade, numero_crm, curriculo)
                              VALUES ('medico', %s, %s, %s, %s, %s, %s, %s, %s)""",
                           (usuario, senha, nome_completo, telefone, endereco, idade, numero_crm, curriculo_path))
        elif tipo_usuario == "enfermeiro":
            numero_coren = request.form["numero_coren"]
            cursor.execute("""INSERT INTO usuario (tipo, usuario, senha, nome_completo, telefone, endereco, idade, numero_coren, curriculo)
                              VALUES ('enfermeiro', %s, %s, %s, %s, %s, %s, %s, %s)""",
                           (usuario, senha, nome_completo, telefone, endereco, idade, numero_coren, curriculo_path))
        elif tipo_usuario == "cuidador":
            numero_cpf = request.form["numero_cpf"]
            cursor.execute("""INSERT INTO usuario (tipo, usuario, senha, nome_completo, telefone, endereco, idade, numero_cpf, curriculo)
                              VALUES ('cuidador', %s, %s, %s, %s, %s, %s, %s, %s)""",
                           (usuario, senha, nome_completo, telefone, endereco, idade, numero_cpf, curriculo_path))

        db.commit()
        return redirect(url_for("admin_dashboard"))

    return render_template("cadastrar_usuario.html")

@app.route("/cadastrar", methods=["GET", "POST"])
def cadastrar():
    if request.method == "POST":
        nome = request.form["nome"]
        data_nascimento = request.form["data_nascimento"]
        idade = request.form["idade"]
        genero = request.form["genero"]
        estado_civil = request.form["estado_civil"]
        cpf = request.form["cpf"]
        rg = request.form["rg"]
        telefone = request.form["telefone"]
        endereco = request.form["endereco"]
        nome_responsavel = request.form.get("nome_responsavel", "")
        telefone_responsavel = request.form.get("telefone_responsavel", "")
        grau_parentesco = request.form.get("grau_parentesco", "")

        # Verifica se o CPF já está cadastrado
        cursor.execute("SELECT * FROM paciente WHERE cpf = %s", (cpf,))
        paciente_existente = cursor.fetchone()

        if paciente_existente:
            return "<h1>CPF já cadastrado. Por favor, verifique os dados.</h1><a href='/admin_dashboard'>Voltar ao início</a>"

        # Insere o paciente no banco de dados
        cursor.execute("""INSERT INTO paciente (nome, data_nascimento, idade, genero, estado_civil, cpf, rg, telefone, endereco, nome_responsavel, telefone_responsavel, grau_parentesco)
                          VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                       (nome, data_nascimento, idade, genero, estado_civil, cpf, rg, telefone, endereco, nome_responsavel, telefone_responsavel, grau_parentesco))
        db.commit()

        return redirect(url_for("cadastrar_info_adicional", cpf=cpf))

    return render_template("cadastrar.html", usuario=session.get('usuario'))

# Rota para cadastrar informações adicionais
@app.route("/cadastrar_info_adicional/<cpf>", methods=["GET", "POST"])
def cadastrar_info_adicional(cpf):
    cursor.execute("SELECT * FROM paciente WHERE cpf = %s", (cpf,))
    paciente = cursor.fetchone()

    if not paciente:
        return "<h1>Paciente não encontrado.</h1><a href='/admin_dashboard'>Voltar ao início</a>"

    # Verifica se o usuário está logado e obtém o nome do usuário
    usuario = session.get('usuario')
    if not usuario:
        return redirect(url_for('login'))

    if request.method == "POST":
        doencas_cronicas = request.form.get("doencas_cronicas", "")
        alergias = request.form.get("alergias", "")
        medicamentos = request.form.get("medicamentos", "")
        cirurgias = request.form.get("cirurgias", "")
        historico_internacoes = request.form.get("historico_internacoes", "")
        vacinas = request.form.get("vacinas", "")
        exames = request.form.get("exames", "")
        condicoes_cognitivas = request.form.get("condicoes_cognitivas", "")
        alteracoes_humor = request.form.get("alteracoes_humor", "")
        comportamento_social = request.form.get("comportamento_social", "")

        try:
            cursor.execute("""UPDATE paciente
                              SET doencas_cronicas = %s, alergias = %s, medicamentos = %s, cirurgias = %s, 
                                  historico_internacoes = %s, vacinas = %s, exames = %s,
                                  condicoes_cognitivas = %s, alteracoes_humor = %s, comportamento_social = %s
                              WHERE cpf = %s""",
                           (doencas_cronicas, alergias, medicamentos, cirurgias, historico_internacoes, vacinas, exames, condicoes_cognitivas, alteracoes_humor, comportamento_social, cpf))
            db.commit()
            print("Informações salvas com sucesso.")  # Mensagem de sucesso
        except Exception as e:
            print(f"Ocorreu um erro ao salvar: {e}")  # Mensagem de erro

        return redirect(url_for("admin_dashboard"))  # Redirecionar para o painel do administrador

    return render_template("cadastrar_info_adicional.html", paciente=paciente, usuario=usuario)

# Página de busca de paciente
@app.route("/buscar", methods=["GET", "POST"])
def buscar():
    if request.method == "POST":
        cpf = request.form["cpf"]
        cursor.execute("SELECT * FROM paciente WHERE cpf = %s", (cpf,))
        paciente = cursor.fetchone()

        if paciente:
            return redirect(url_for("ver_relatorios", cpf=cpf))
        else:
            flash("Paciente não encontrado.")
    
    return render_template("buscar.html", usuario=session.get('usuario'))

@app.route('/ver_relatorios/<cpf>')
def ver_relatorios(cpf):
    # A lógica para visualizar relatórios será implementada aqui
    pass

if __name__ == "__main__":
    app.run(debug=True)
