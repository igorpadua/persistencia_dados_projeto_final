<%--
  Created by IntelliJ IDEA.
  User: igorpadua
  Date: 11/01/2024
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Criar vacina</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h1>Criar vacina</h1>

<form action="/agenda_vacinacao_war_exploded/vacina?acao=salvar" method="post">
    <div class="form-group">
        <label for="titulo">Titulo</label>
        <input type="text" class="form-control" id="titulo" name="titulo">
    </div>
    <div class="form-group">
        <label for="descricao">descricao</label>
        <input type="text" class="form-control" id="descricao" name="descricao">
    </div>
    <div class="form-group">
        <label for="doses">doses</label>
        <input type="number" class="form-control" id="doses" name="doses" value="0">
    </div>
    <div class="form-group">
        <label for="periodicidade">periodicidade</label>
        <input type="number" class="form-control" id="periodicidade" name="periodicidade" value="0">
    </div>
    <div class="form-group">
        <label for="intervalo">Intervalo</label>
        <input type="number" class="form-control" id="intervalo" name="intervalo" value="0">
    </div>
    <br>
    <input type="submit" value="Salvar" class="btn btn-primary">
</form>
</body>
</html>
