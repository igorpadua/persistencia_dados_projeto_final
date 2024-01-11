package com.igor.agenda_vacinacao.controller;

import com.igor.agenda_vacinacao.model.Vacina;
import com.igor.agenda_vacinacao.service.VacinaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/vacina")
public class VacinaController extends HttpServlet {
    private final VacinaService vacinaService = new VacinaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        if (tipoAcao.equals("salvar")) {
            salvar(request, response);
        }
    }

    private void salvar(HttpServletRequest request, HttpServletResponse response) {
        Vacina vacina = new Vacina();
        vacina.setTitulo(request.getParameter("titulo"));
        vacina.setDescricao(request.getParameter("descricao"));
        vacina.setDoses(Integer.parseInt(request.getParameter("doses")));
        vacina.setPeriodicidade(Integer.parseInt(request.getParameter("periodicidade")));
        vacina.setIntervalo(Integer.parseInt(request.getParameter("intervalo")));

        vacinaService.salvar(vacina);
        request.setAttribute("vacinaSalvo", vacina.getTitulo());
    }
}
