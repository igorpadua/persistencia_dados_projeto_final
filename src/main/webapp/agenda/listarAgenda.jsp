<%@ page import="com.igor.agenda_vacinacao.model.Agenda" %>
<%@ page import="java.util.List" %>
<%@ page import="com.igor.agenda_vacinacao.util.FormatterDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Agendas</title>
    <%
        String filtroAtual = (String) request.getAttribute("filtro");
    %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<h1>Lista de Agendas</h1>
<form action="/agenda_vacinacao_war_exploded/agenda?acao=listaFiltrada" method="get">
    <input type="hidden" name="acao" value="listaFiltrada">
    <select name="filtro" id="filtro" class="form-select">
        <option value="Todos" <%=filtroAtual.equals("Todos") ? "selected" : ""%>>Todos</option>
        <option value="Agendado" <%=filtroAtual.equals("Agendado") ? "selected" : ""%>>Agendado</option>
        <option value="Realizado" <%=filtroAtual.equals("Realizado") ? "selected" : ""%>>Realizado</option>
        <option value="Cancelado" <%=filtroAtual.equals("Cancelado") ? "selected" : ""%>>Cancelado</option>
        <option value="DiaCorrente" <%=filtroAtual.equals("DiaCorrente") ? "selected" : ""%>>Dia corrente</option>

    </select>
    <input type="submit" value="Filtrar" class="btn btn btn-primary">
</form>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Data</th>
        <th scope="col">Hora</th>
        <th scope="col">Situação</th>
        <th scope="col">Data situação</th>
        <th scope="col">Observação</th>
        <th scope="col">Usuário</th>
        <th scope="col">Vacina</th>
        <th scope="col">Editar</th>
        <th scope="col">Excluir</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Agenda> agendas = (List<Agenda>) request.getAttribute("agendas");
        for (Agenda agenda : agendas) {
            out.println("<tr>");
            out.println("<td>" + agenda.getId() + "</td>");
            out.println("<td>" + FormatterDate.dateToString(agenda.getData()) + "</td>");
            out.println("<td>" + agenda.getHora() + "</td>");
            out.println("<td>" + agenda.getSituacao() + "</td>");
            out.println("<td>" + FormatterDate.dateToString(agenda.getDataSituacao()) + "</td>");
            out.println("<td>" + agenda.getObservacao() + "</td>");
            out.println("<td>" + agenda.getUsuario().getNome() + "</td>");
            out.println("<td>" + agenda.getVacina().getTitulo() + "</td>");
            out.println("<td><a href='/agenda_vacinacao_war_exploded/agenda?acao=editar&id=" + agenda.getId() + "'>Editar</a></td>");
            out.println("<td><a href='/agenda_vacinacao_war_exploded/agenda?acao=excluir&id=" + agenda.getId() + "'>Excluir</a></td>");
        }
    %>
    </tbody>
</table>
<br>
<a href="/agenda_vacinacao_war_exploded">Voltar</a>
</body>
</html>
