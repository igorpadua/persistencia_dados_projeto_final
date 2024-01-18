<%@ page import="com.igor.agenda_vacinacao.model.Vacina" %><%--
  Created by IntelliJ IDEA.
  User: igorpadua
  Date: 11/01/2024
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Vacina vacina = (Vacina) request.getAttribute("vacina");
    %>
    <title>Editar Vacina</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Editar Vacina</h1>

<form action="/agenda_vacinacao_war_exploded/vacina?acao=alterar" method="post">
    <input type="hidden" name="id" value="<%=vacina.getId()%>">
    <div class="form-group">
        <label for="titulo">Titulo</label>
        <input type="text" class="form-control" id="titulo" name="titulo" value="<%=vacina.getTitulo()%>">
    </div>
    <div class="form-group">
        <label for="descricao">descricao</label>
        <input type="text" class="form-control" id="descricao" name="descricao" value="<%=vacina.getDescricao()%>">
    </div>
    <div class="form-group">
        <label for="doses">doses</label>
        <input type="number" class="form-control" id="doses" name="doses" value="<%=vacina.getDoses()%>">
    </div>
    <div class="form-group">
        <label for="periodicidade">periodicidade</label>
        <select class="form-control" id="periodicidade" name="periodicidade">
            <option value="0" <%=vacina.getPeriodicidade() == 0 ? "selected" : ""%>>Unica</option>
            <option value="1" <%=vacina.getPeriodicidade() == 1 ? "selected" : ""%>>Diaria</option>
            <option value="2" <%=vacina.getPeriodicidade() == 2 ? "selected" : ""%>>Semanal</option>
            <option value="3" <%=vacina.getPeriodicidade() == 3 ? "selected" : ""%>>Mensal</option>
            <option value="4" <%=vacina.getPeriodicidade() == 4 ? "selected" : ""%>>Anual</option>
        </select>
    </div>
    <div class="form-group">
        <label for="intervalo">Intervalo</label>
        <input type="number" class="form-control" id="intervalo" name="intervalo" value="<%=vacina.getIntervalo()%>">
    </div>
    <br>
    <input type="submit" value="Salvar" class="btn btn-primary">
</form>
</body>
</html>
