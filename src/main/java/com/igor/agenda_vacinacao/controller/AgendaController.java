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
import java.util.Date;
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
            case "editar":
                buscaAgendaUsuarioVacina(request, response);
                break;
            case "listaFiltrada":
                listaFiltrada(request, response);
                break;
            case "pesquisar":
                pesquisarNomeUsuario(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        switch (tipoAcao) {
            case "salvar":
                salvar(request, response);
                break;
            case "alterar":
                alteraAgenda(request, response);
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

        if (agenda.getVacina().getDoses() > 1) {
            int periocidade = agenda.getVacina().getPeriodicidade();
            int intervalo = agenda.getVacina().getIntervalo();
            for (int i = 0; i < agenda.getVacina().getDoses() - 1; i++) {
                Agenda agendaAux = new Agenda();
                agendaAux.setData(FormatterDate.adicionarTempo(agenda.getData(), periocidade, intervalo + i));
                agendaAux.setHora(agenda.getHora());
                agendaAux.setSituacao(Situacao.AGENDADO);
                agendaAux.setDataSituacao(agendaAux.getData());
                agendaAux.setObservacao(agenda.getObservacao());
                agendaAux.setUsuario(agenda.getUsuario());
                agendaAux.setVacina(agenda.getVacina());
                agendaService.salvar(agendaAux);
            }
        }

        listar(request, response);
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Agenda> agendas = agendaService.buscarTodos();
        request.setAttribute("agendas", agendas);
        request.setAttribute("filtro", "Todos");
        request.getRequestDispatcher("agenda/listarAgenda.jsp").forward(request, response);
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Agenda agenda = agendaService.buscarPorId(id);
        agendaService.remover(agenda);
        request.setAttribute("agendaExcluida", agenda.getId());
        listar(request, response);
    }

    private void buscaAgendaUsuarioVacina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Agenda agenda = agendaService.buscarPorId(id);
        request.setAttribute("agenda", agenda);

        List<Usuario> usuarios = usuarioService.buscarTodos();
        List<Vacina> vacinas = vacinaService.buscarTodos();
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("vacinas", vacinas);

        request.getRequestDispatcher("agenda/editarAgenda.jsp").forward(request, response);
    }

    private void alteraAgenda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Agenda agenda = agendaService.buscarPorId(Long.parseLong(request.getParameter("id")));
        agenda.setData(FormatterDate.stringToDate(request.getParameter("data")));
        int hora = Integer.parseInt(request.getParameter("hora").substring(0, 2));
        int minuto = Integer.parseInt(request.getParameter("hora").substring(3, 5));
        agenda.setHora(new Time(hora, minuto, 0));
        agenda.setSituacao(Situacao.valueOf(request.getParameter("situacao")));

        if (agenda.getSituacao().equals(Situacao.REALIZADO) || agenda.getSituacao().equals(Situacao.CANCELADO)) {
            agenda.setDataSituacao(new Date());
        } else {
            agenda.setDataSituacao(FormatterDate.stringToDate(request.getParameter("dataSituacao")));
        }

        agenda.setObservacao(request.getParameter("observacao"));
        agenda.setUsuario(usuarioService.buscarPorId(Long.parseLong(request.getParameter("usuario"))));
        agenda.setVacina(vacinaService.buscarPorId(Long.parseLong(request.getParameter("vacina"))));

        agendaService.atualizar(agenda);
        listar(request, response);
    }

    private void listaFiltrada(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filtro = request.getParameter("filtro");
        List<Agenda> agendas = agendaService.buscarTodos();

        switch (filtro) {
            case "Agendado":
                agendas.removeIf(agenda -> !agenda.getSituacao().equals(Situacao.AGENDADO));
                break;
            case "Realizado":
                agendas.removeIf(agenda -> !agenda.getSituacao().equals(Situacao.REALIZADO));
                break;
            case "Cancelado":
                agendas.removeIf(agenda -> !agenda.getSituacao().equals(Situacao.CANCELADO));
                break;
            case "DiaCorrente":
                agendas.removeIf(agenda -> !FormatterDate.dateToString(new Date()).equals(FormatterDate.dateToString(agenda.getData())));

                agendas.sort((agenda1, agenda2) -> {
                    if (agenda1.getSituacao().equals(Situacao.AGENDADO) && agenda2.getSituacao().equals(Situacao.REALIZADO)) {
                        return -1;
                    } else if (agenda1.getSituacao().equals(Situacao.REALIZADO) && agenda2.getSituacao().equals(Situacao.AGENDADO)) {
                        return 1;
                    } else if (agenda1.getSituacao().equals(Situacao.AGENDADO) && agenda2.getSituacao().equals(Situacao.CANCELADO)) {
                        return -1;
                    } else if (agenda1.getSituacao().equals(Situacao.CANCELADO) && agenda2.getSituacao().equals(Situacao.AGENDADO)) {
                        return 1;
                    } else if (agenda1.getSituacao().equals(Situacao.REALIZADO) && agenda2.getSituacao().equals(Situacao.CANCELADO)) {
                        return -1;
                    } else if (agenda1.getSituacao().equals(Situacao.CANCELADO) && agenda2.getSituacao().equals(Situacao.REALIZADO)) {
                        return 1;
                    } else {
                        return 0;
                    }
                });
                break;
        }

        request.setAttribute("agendas", agendas);
        request.setAttribute("filtro", filtro);
        request.getRequestDispatcher("agenda/listarAgenda.jsp").forward(request, response);
    }

    private void pesquisarNomeUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("pesquisa");
        List<Agenda> agendas = agendaService.buscarTodos();
        agendas.removeIf(agenda -> !agenda.getUsuario().getNome().toLowerCase().contains(nome.toLowerCase()));
        request.setAttribute("agendas", agendas);
        request.setAttribute("filtro", "Pesquisa");
        request.getRequestDispatcher("agenda/listarAgenda.jsp").forward(request, response);
    }
}
