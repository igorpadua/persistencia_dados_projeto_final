package com.igor.agenda_vacinacao.controller;

import com.igor.agenda_vacinacao.model.Agenda;
import com.igor.agenda_vacinacao.model.Situacao;
import com.igor.agenda_vacinacao.model.Usuario;
import com.igor.agenda_vacinacao.model.Vacina;
import com.igor.agenda_vacinacao.service.AgendaService;
import com.igor.agenda_vacinacao.service.UsuarioService;
import com.igor.agenda_vacinacao.service.VacinaService;
import com.igor.agenda_vacinacao.util.FormatterDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Time;
import java.util.List;

@WebServlet("/agenda")
public class AgendaController extends HttpServlet {
    private final AgendaService agendaService = new AgendaService();

    private final UsuarioService usuarioService = new UsuarioService();
    private final VacinaService vacinaService = new VacinaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        switch (tipoAcao) {
            case "usuariosVacinas":
                usuariosVacinas(request, response);
                break;
            case "listar":
                listar(request, response);
                break;
            case "excluir":
                excluir(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        switch (tipoAcao) {
            case "salvar":
                salvar(request, response);
                break;
        }
    }

    private void usuariosVacinas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> usuarios = usuarioService.buscarTodos();
        List<Vacina> vacinas = vacinaService.buscarTodos();
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("vacinas", vacinas);

        request.getRequestDispatcher("agenda/criarAgenda.jsp").forward(request, response);
    }

    private void salvar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Agenda agenda = new Agenda();
        agenda.setData(FormatterDate.stringToDate(request.getParameter("data")));
        int hora = Integer.parseInt(request.getParameter("hora").substring(0, 2));
        int minuto = Integer.parseInt(request.getParameter("hora").substring(3, 5));
        agenda.setHora(new Time(hora, minuto, 0));
        agenda.setSituacao(Situacao.valueOf(request.getParameter("situacao")));
        agenda.setDataSituacao(FormatterDate.stringToDate(request.getParameter("dataSituacao")));
        agenda.setObservacao(request.getParameter("observacao"));
        agenda.setUsuario(usuarioService.buscarPorId(Long.parseLong(request.getParameter("usuario"))));
        agenda.setVacina(vacinaService.buscarPorId(Long.parseLong(request.getParameter("vacina"))));

        agendaService.salvar(agenda);
        listar(request, response);
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Agenda> agendas = agendaService.buscarTodos();
        request.setAttribute("agendas", agendas);
        request.getRequestDispatcher("agenda/listarAgenda.jsp").forward(request, response);
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Agenda agenda = agendaService.buscarPorId(id);
        agendaService.remover(agenda);
        request.setAttribute("agendaExcluida", agenda.getId());
        listar(request, response);
    }
}
