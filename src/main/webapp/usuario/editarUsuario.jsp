<%@ page import="com.igor.agenda_vacinacao.model.Usuario" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.igor.agenda_vacinacao.model.Alergia" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edita Usuário</title>
    <%
        Usuario usuario = (Usuario) request.getAttribute("usuario");
        Date dataNascimento = usuario.getDataNascimento();
        String dataFormada = (dataNascimento != null) ? new SimpleDateFormat("yyyy-MM-dd").format(dataNascimento) : "";
    %>
    <%--Boostrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h2>Editar Usuário</h2>

<form action="/agenda_vacinacao_war_exploded/usuario?acao=alterar" method="post">
    <input type="hidden" name="acao" value="salvar">
    <input type="hidden" name="id" value="<%=usuario.getId()%>">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="text" name="nome" id="nome" class="form-control" value="<%=usuario.getNome()%>">
    </div>
    <div class="form-group">
        <label for="dataNascimento">Data de nascimento</label>
        <input type="date" name="dataNascimento" id="dataNascimento" class="form-control" value="<%=dataFormada%>">
    </div>
    <div class="form-group">
        <label for="sexo">Sexo</label>
        <select name="sexo" id="sexo" class="form-control">
            <option value="M" <%=usuario.getSexo() == 'M' ? "selected" : ""%>>Masculino</option>
            <option value="F" <%=usuario.getSexo() == 'F' ? "selected" : ""%>>Feminino</option>
        </select>
    </div>
    <div class="form-control">
        <label for="cidade">Cidade</label>
        <input type="text" name="cidade" id="cidade" class="form-control" value="<%=usuario.getCidade()%>">
    </div>
    <div class="form-control">
        <label for="UF">UF</label>
        <select name="UF" id="UF" class="form-control">
            <option value="" selected disabled>Selecione</option>
            <option value="AC" <%=usuario.getUf().equals("AC") ? "selected" : ""%>>Acre</option>
            <option value="AL" <%=usuario.getUf().equals("AL") ? "selected" : ""%>>Alagoas</option>
            <option value="AP" <%=usuario.getUf().equals("AP") ? "selected" : ""%>>Amapá</option>
            <option value="AM" <%=usuario.getUf().equals("AM") ? "selected" : ""%>>Amazonas</option>
            <option value="BA" <%=usuario.getUf().equals("BA") ? "selected" : ""%>>Bahia</option>
            <option value="CE" <%=usuario.getUf().equals("CE") ? "selected" : ""%>>Ceará</option>
            <option value="DF" <%=usuario.getUf().equals("DF") ? "selected" : ""%>>Distrito Federal</option>
            <option value="GO" <%=usuario.getUf().equals("GO") ? "selected" : ""%>>Goiás</option>
            <option value="ES" <%=usuario.getUf().equals("ES") ? "selected" : ""%>>Espírito Santo</option>
            <option value="MA" <%=usuario.getUf().equals("MA") ? "selected" : ""%>>Maranhão</option>
            <option value="MT" <%=usuario.getUf().equals("MT") ? "selected" : ""%>>Mato Grosso</option>
            <option value="MS" <%=usuario.getUf().equals("MS") ? "selected" : ""%>>Mato Grosso do Sul</option>
            <option value="MG" <%=usuario.getUf().equals("MG") ? "selected" : ""%>>Minas Gerais</option>
            <option value="PA" <%=usuario.getUf().equals("PA") ? "selected" : ""%>>Pará</option>
            <option value="PB" <%=usuario.getUf().equals("PB") ? "selected" : ""%>>Paraíba</option>
            <option value="PR" <%=usuario.getUf().equals("PR") ? "selected" : ""%>>Paraná</option>
            <option value="PE" <%=usuario.getUf().equals("PE") ? "selected" : ""%>>Pernambuco</option>
            <option value="PI" <%=usuario.getUf().equals("PI") ? "selected" : ""%>>Piauí</option>
            <option value="RJ" <%=usuario.getUf().equals("RJ") ? "selected" : ""%>>Rio de Janeiro</option>
            <option value="RN" <%=usuario.getUf().equals("RN") ? "selected" : ""%>>Rio Grande do Norte</option>
            <option value="RS" <%=usuario.getUf().equals("RS") ? "selected" : ""%>>Rio Grande do Sul</option>
            <option value="RO" <%=usuario.getUf().equals("RO") ? "selected" : ""%>>Rondônia</option>
            <option value="RR" <%=usuario.getUf().equals("RR") ? "selected" : ""%>>Roraima</option>
            <option value="SC" <%=usuario.getUf().equals("SC") ? "selected" : ""%>>Santa Catarina</option>
            <option value="SP" <%=usuario.getUf().equals("SP") ? "selected" : ""%>>São Paulo</option>
            <option value="SE" <%=usuario.getUf().equals("SE") ? "selected" : ""%>>Sergipe</option>
            <option value="TO" <%=usuario.getUf().equals("TO") ? "selected" : ""%>>Tocantins</option>
        </select>
    </div>
    <div class="form-control">
        <label for="logradouro">Logradouro</label>
        <input type="text" name="logradouro" id="logradouro" class="form-control" value="<%=usuario.getLogradouro()%>">
    </div>
    <div class="form-control">
        <label for="setor">Setor</label>
        <input type="text" name="setor" id="setor" class="form-control" value="<%=usuario.getSetor()%>">
    </div>
    <div class="form-control">
        <label for="numero">Numero</label>
        <input type="number" name="numero" id="numero" class="form-control" value="<%=usuario.getNumero()%>">
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

    <input type="submit" value="Alterar" class="btn btn-primary">
</form>

</body>
</html>
