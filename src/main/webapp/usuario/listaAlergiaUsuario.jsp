<%@ page import="com.igor.agenda_vacinacao.model.Alergia" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alergias do usuário></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<input type="hidden" name="acao" value="listar"/>
<%
    String nome = (String) request.getAttribute("nome");
    out.println("<h1>Lista de alergias do/da " + nome + "</h1>");
%>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Nome</th>
    </tr>
    </thead>
    <tbody>
    <%
        Set<Alergia> alergias = (Set<Alergia>) request.getAttribute("alergias");
        for (Alergia alergia : alergias) {
            out.println("<tr>");
            out.println("<td>" + alergia.getId() + "</td>");
            out.println("<td>" + alergia.getNome() + "</td>");
            out.println("</tr>");
        }
    %>
    </tbody>
</table>

</body>
</html>
