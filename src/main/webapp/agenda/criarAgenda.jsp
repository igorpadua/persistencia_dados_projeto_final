<%@ page import="com.igor.agenda_vacinacao.model.Usuario" %>
<%@ page import="com.igor.agenda_vacinacao.model.Vacina" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Criar agenda</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Criar agenda</h1>
<form action="/agenda_vacinacao_war_exploded/agenda?acao=salvar" method="post">
    <input type="hidden" name="acao" value="salvar">
    <div class="form-group">
        <label for="data">Data de aplicação</label>
        <input type="date" class="form-control" id="data" name="data">
    </div>
    <div class="form-group">
        <label for="hora">Hora de aplicação</label>
        <input type="time" class="form-control" id="hora" name="hora">
    </div>
    <div class="form-group">
        <label for="situacao">Situação</label>
        <select class="form-control" id="situacao" name="situacao">
            <option value="AGENDADO">Agendado</option>
            <option value="CANCELADO">Cancelado</option>
            <option value="REALIZADO">Realizado</option>
        </select>
    </div>
    <div class="form-group">
        <label for="dataSituacao">Data situação</label>
        <input type="date" class="form-control" id="dataSituacao" name="dataSituacao">
    </div>
    <div class="form-group">
        <label for="observacao">Observação</label>
        <input type="text" class="form-control" id="observacao" name="observacao">
    </div>
    <div class="form-group">
        <label for="usuario">Usuário</label>
        <select name="usuario" id="usuario" class="form-control">
            <%
                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                for (Usuario usuario : usuarios) {
                    out.println("<option value='" + usuario.getId() + "'>" + usuario.getNome() + "</option>");
                }
            %>
        </select>
    </div>
    <div class="form-group">
        <label for="vacina">Vacina</label>
        <select name="vacina" id="vacina" class="form-control">
            <%
                List<Vacina> vacinas = (List<Vacina>) request.getAttribute("vacinas");
                for (Vacina vacina : vacinas) {
                    out.println("<option value='" + vacina.getId() + "'>" + vacina.getTitulo() + "</option>");
                }
            %>
        </select>
    </div>
    <br>
    <input type="submit" value="Salvar" class="btn btn-primary">
</form>
</body>
</html>
