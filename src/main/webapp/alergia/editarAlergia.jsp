<%@ page import="com.igor.agenda_vacinacao.model.Alergia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Alergia</title>
    <%
        Alergia alergia = (Alergia) request.getAttribute("alergia");
    %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h1>Editar alergia</h1>

<form action="/agenda_vacinacao_war_exploded/alergia?acao=alterar" method="post">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="hidden" name="id" id="id" value="<%=alergia.getId()%>">
        <input type="text" name="nome" id="nome" class="form-control" value="<%=alergia.getNome()%>">
    </div>
    <br>
    <input type="submit" value="Salvar" class="btn btn-primary">
</form>

</body>
</html>
