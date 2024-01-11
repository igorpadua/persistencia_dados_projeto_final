<%@ page import="com.igor.agenda_vacinacao.model.Vacina" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: igorpadua
  Date: 11/01/2024
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Vacinas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<input type="hidden" name="acao" value="listar">
<h1>Lista de Vacinas</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Titulo</th>
        <th scope="col">Descriçao</th>
        <th scope="col">Doses</th>
        <th scope="col">Periodicidade</th>
        <th scope="col">Intervalo</th>
        <th scope="col">Editar</th>
        <th scope="col">Excluir</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Vacina> vacinas = (List<Vacina>) request.getAttribute("vacinas");
        for (Vacina vacina : vacinas) {
            out.println("<tr>");
            out.println("<td>" + vacina.getId() + "</td>");
            out.println("<td>" + vacina.getTitulo() + "</td>");
            out.println("<td>" + vacina.getDescricao() + "</td>");
            out.println("<td>" + vacina.getDoses() + "</td>");
            out.println("<td>" + vacina.getPeriodicidade() + "</td>");
            out.println("<td>" + vacina.getIntervalo() + "</td>");
            out.println("<td><a href='?acao=editar&id=" + vacina.getId() + "'>Editar</a></td>");
            out.println("<td><a href='?acao=excluir&id=" + vacina.getId() + "'>Excluir</a></td>");
            out.println("</tr>");
        }
    %>
    </tbody>
</table>
<a href="/agenda_vacinacao_war_exploded">Voltar</a>
</body>
</html>
