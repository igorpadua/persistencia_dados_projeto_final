package com.igor.agenda_vacinacao.controller;

import com.igor.agenda_vacinacao.model.Agenda;
import com.igor.agenda_vacinacao.service.AgendaService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "/api/angenda")
public class AgendaController extends HttpServlet {
    private final AgendaService service = new AgendaService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipoAcao = req.getParameter("acao");
        if (tipoAcao.equals("listar")) {
            listar(req, resp);
        }
    }

    private void listar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Agenda> agendas = service.buscarTodos();
        req.setAttribute("agendas", agendas);

        RequestDispatcher rd = req.getRequestDispatcher("listarAgendas.jsp");
        rd.forward(req, resp);
    }
}
