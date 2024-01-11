package com.igor.agenda_vacinacao.controller;

import com.igor.agenda_vacinacao.model.Alergia;
import com.igor.agenda_vacinacao.service.AlergiaService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/alergia")
public class AlergiaController extends HttpServlet {
    private final AlergiaService alergiaService = new AlergiaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        switch (tipoAcao) {
            case "listar":
                listar(request, response);
                break;
            case "excluir":
                excluir(request, response);
                break;
            case "editar":
                buscaAlergiaPorId(request, response);
                break;
            case "alergias":
                listarAlergias(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        if (tipoAcao.equals("salvar")) {
            salvar(request, response);
        } else if (tipoAcao.equals("alterar")) {
            alteraAlergia(request, response);
        }
    }

    private void salvar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Alergia alergia = new Alergia();
        alergia.setNome(request.getParameter("nome"));

        alergiaService.salvar(alergia);
        request.setAttribute("alergiaSalvo", alergia.getNome());
        listar(request, response);
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Alergia> alergias = alergiaService.buscarTodos();
        request.setAttribute("alergias", alergias);

        RequestDispatcher dispatcher = request.getRequestDispatcher("alergia/listarAlergia.jsp");
        dispatcher.forward(request, response);
    }

    private void listarAlergias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Alergia> alergias = alergiaService.buscarTodos();
        request.setAttribute("alergias", alergias);

        RequestDispatcher dispatcher = request.getRequestDispatcher("usuario/criarUsuario.jsp");
        dispatcher.forward(request, response);
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Alergia alergia = alergiaService.buscarPorId(id);
        alergiaService.remover(alergia);
        request.setAttribute("alergiaExcluido", alergia.getNome());
        listar(request, response);
    }

    private void buscaAlergiaPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Alergia alergia = alergiaService.buscarPorId(id);
        request.setAttribute("alergia", alergia);
        RequestDispatcher dispatcher = request.getRequestDispatcher("alergia/editarAlergia.jsp");
        dispatcher.forward(request, response);
    }

    private void alteraAlergia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Alergia alergia = alergiaService.buscarPorId(id);
        alergia.setNome(request.getParameter("nome"));

        alergiaService.atualizar(alergia);
        listar(request, response);
    }
}
