<%@ page import="java.util.List" %>
<%@ page import="com.igor.agenda_vacinacao.model.Usuario" %>
<%@ page import="com.igor.agenda_vacinacao.util.FormatterDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de usuários</title>
    <%--Boostrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<input type="hidden" name="acao" value="listar"/>
<h1>Lista de usuários</h1>
<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Data Nascimento</th>
        <th>Sexo</th>
        <th>Logradouro</th>
        <th>Número</th>
        <th>Setor</th>
        <th>Cidade</th>
        <th>UF</th>
        <th>Alergias</th>
        <th>Editar</th>
        <th>Excluir</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
        for (Usuario usuario : usuarios) {
            out.println("<tr>");
            out.println("<td>" + usuario.getId() + "</td>");
            out.println("<td>" + usuario.getNome() + "</td>");
            out.println("<td>" + FormatterDate.dateToString(usuario.getDataNascimento()) + "</td>");
            out.println("<td>" + usuario.getSexo() + "</td>");
            out.println("<td>" + usuario.getLogradouro() + "</td>");
            out.println("<td>" + usuario.getNumero() + "</td>");
            out.println("<td>" + usuario.getSetor() + "</td>");
            out.println("<td>" + usuario.getCidade() + "</td>");
            out.println("<td>" + usuario.getUf() + "</td>");
            out.println("<td><a href='/agenda_vacinacao_war_exploded/usuario?acao=alergias&id=" + usuario.getId() + "'>Alergias</a></td>");
            out.println("<td><a href='/agenda_vacinacao_war_exploded/usuario?acao=editar&id=" + usuario.getId() + "'>Editar</a></td>");
            out.println("<td><a href='/agenda_vacinacao_war_exploded/usuario?acao=excluir&id=" + usuario.getId() + "'>Excluir</a></td>");
            out.println("</tr>");
        }
    %>
    </tbody>
</table>
<br>
<a href="/agenda_vacinacao_war_exploded">Voltar</a>
</body>
</html>
