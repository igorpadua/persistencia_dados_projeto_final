<%@ page import="com.igor.agenda_vacinacao.model.Usuario" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: igorpadua
  Date: 22/01/2024
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quantidade de pessoas por UF</title>
    <%--Boostrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<input type="hidden" name="acao" value="quantidadePessoasPorEstado"/>
<h1>Quantidade de pessoas por UF</h1>
<table class="table">
    <thead>
    <tr>
        <th>UF</th>
        <th>Quantidade de pessoas</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Object[]> quantidadePessoasPorEstado = (List<Object[]>) request.getAttribute("quantidadePessoas");
        for (Object[] quantidadePessoa : quantidadePessoasPorEstado) {
            out.println("<tr>");
            out.println("<td>" + quantidadePessoa[1] + "</td>");
            out.println("<td>" + quantidadePessoa[0] + "</td>");
            out.println("</tr>");
        }
    %>
    </tbody>
</table>
<br>
<a href="/agenda_vacinacao_war_exploded">Voltar</a>
</body>
</html>
