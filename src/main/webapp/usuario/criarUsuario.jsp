<%@ page import="com.igor.agenda_vacinacao.model.Alergia" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Novo Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h2>Novo usuário</h2>
<form action="/agenda_vacinacao_war_exploded/usuario?acao=salvar" method="post">
    <input type="hidden" name="acao" value="salvar">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="text" name="nome" id="nome" class="form-control">
    </div>
    <div class="form-group">
        <label for="dataNascimento">Data de nascimento</label>
        <input type="date" name="dataNascimento" id="dataNascimento" class="form-control">
    </div>
    <div class="form-group">
        <label for="sexo">Sexo</label>
        <select name="sexo" id="sexo" class="form-control">
            <option value="M">Masculino</option>
            <option value="F">Feminino</option>
        </select>
    </div>
    <div class="form-control">
        <label for="cidade">Cidade</label>
        <input type="text" name="cidade" id="cidade" class="form-control">
    </div>
    <div class="form-control">
        <label for="UF">UF</label>
        <select name="UF" id="UF" class="form-control">
            <option value="" selected disabled>Selecione</option>
            <option value="AC">Acre</option>
            <option value="AL">Alagoas</option>
            <option value="AP">Amapá</option>
            <option value="AM">Amazonas</option>
            <option value="BA">Bahia</option>
            <option value="CE">Ceará</option>
            <option value="DF">Distrito Federal</option>
            <option value="GO" >Goiás</option>
            <option value="ES">Espírito Santo</option>
            <option value="MA">Maranhão</option>
            <option value="MT">Mato Grosso</option>
            <option value="MS" >Mato Grosso do Sul</option>
            <option value="MG">Minas Gerais</option>
            <option value="PA" >Pará</option>
            <option value="PB" >Paraíba</option>
            <option value="PR" >Paraná</option>
            <option value="PE" >Pernambuco</option>
            <option value="PI" >Piauí</option>
            <option value="RJ" >Rio de Janeiro</option>
            <option value="RN" >Rio Grande do Norte</option>
            <option value="RS" >Rio Grande do Sul</option>
            <option value="RO" >Rondônia</option>
            <option value="RR" >Roraima</option>
            <option value="SC" >Santa Catarina</option>
            <option value="SP" >São Paulo</option>
            <option value="SE" >Sergipe</option>
            <option value="TO" >Tocantins</option>
        </select>
    </div>
    <div class="form-control">
        <label for="logradouro">Logradouro</label>
        <input type="text" name="logradouro" id="logradouro" class="form-control">
    </div>
    <div class="form-control">
        <label for="setor">Setor</label>
        <input type="text" name="setor" id="setor" class="form-control">
    </div>
    <div class="form-control">
        <label for="numero">Numero</label>
        <input type="number" name="numero" id="numero" class="form-control">
    </div>

    <div class="form-control">
        <label for="alergia">Alergias:</label>
        <br>
        <%
            List<Alergia> alergias = (List<Alergia>) request.getAttribute("alergias");
            for (Alergia alergia : alergias) {
                out.println("<input type='checkbox' name='alergia' value='" + alergia.getId() + "'>" + alergia.getNome() + "<br>");
            }
        %>
    </div>
    <br>
    <input type="submit" value="Salvar" class="btn btn-primary">
</form>
</body>
</html>