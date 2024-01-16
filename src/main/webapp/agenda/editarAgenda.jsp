<%@ page import="com.igor.agenda_vacinacao.model.Agenda" %>
<%@ page import="com.igor.agenda_vacinacao.model.Situacao" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.igor.agenda_vacinacao.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="com.igor.agenda_vacinacao.model.Vacina" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar agenda</title>
    <%
        Agenda agenda = (Agenda) request.getAttribute("agenda");
        Date data = agenda.getData();
        String dataFormada = (data!= null) ? new SimpleDateFormat("yyyy-MM-dd").format(data) : "";

        Date dataSituacao = agenda.getDataSituacao();
        String dataSituacaoFormada = (dataSituacao!= null) ? new SimpleDateFormat("yyyy-MM-dd").format(dataSituacao) : "";
    %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h2>Editar agenda</h2>

<form action="/agenda_vacinacao_war_exploded/agenda?acao=alterar" method="post">
    <input type="hidden" name="acao" value="alterar">
    <input type="hidden" name="id" value="<%=agenda.getId()%>">
    <div class="form-group">
        <label for="data">Data de aplicação</label>
        <input type="date" class="form-control" id="data" name="data" value="<%=dataFormada%>">
    </div>
    <div class="form-group">
        <label for="hora">Hora de aplicação</label>
        <input type="time" class="form-control" id="hora" name="hora" value="<%=agenda.getHora()%>">
    </div>
    <div class="form-group">
        <label for="situacao">Situação</label>
        <select class="form-control" id="situacao" name="situacao">
            <option value="AGENDADO" <%=agenda.getSituacao() == Situacao.AGENDADO ? "selected" : ""%>>Agendado</option>
            <option value="CANCELADO" <%=agenda.getSituacao() == Situacao.CANCELADO ? "selected" : ""%>>Cancelado</option>
            <option value="REALIZADO" <%=agenda.getSituacao() == Situacao.REALIZADO ? "selected" : ""%>>Realizado</option>
        </select>
    </div>
    <div class="form-group">
        <label for="dataSituacao">Data situação</label>
        <input type="date" class="form-control" id="dataSituacao" name="dataSituacao" value="<%=dataSituacaoFormada%>">
    </div>
    <div class="form-group">
        <label for="observacao">Observação</label>
        <input type="text" class="form-control" id="observacao" name="observacao" value="<%=agenda.getObservacao()%>">
    </div>
    <div class="form-group">
        <label for="usuario">Usuário</label>
        <select name="usuario" id="usuario" class="form-control">
            <%
                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                for (Usuario usuario : usuarios) {
                    out.println("<option value='" + usuario.getId() + "' " + (agenda.getUsuario().getId().equals(usuario.getId()) ? "selected" : "") + ">" + usuario.getNome() + "</option>");
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
                    out.println("<option value='" + vacina.getId() + "' " + (agenda.getVacina().getId().equals(vacina.getId()) ? "selected" : "") + ">" + vacina.getTitulo() + "</option>");
                }
            %>
        </select>
    </div>
    <br>
    <input type="submit" value="Editar" class="btn btn-primary">
</form>

</body>
</html>
