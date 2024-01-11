package com.igor.agenda_vacinacao.controller;

import com.igor.agenda_vacinacao.dao.AlergiaDAO;
import com.igor.agenda_vacinacao.model.Alergia;
import com.igor.agenda_vacinacao.model.Usuario;
import com.igor.agenda_vacinacao.service.AlergiaService;
import com.igor.agenda_vacinacao.service.UsuarioService;
import com.igor.agenda_vacinacao.util.FormatterDate;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/usuario")
public class UsuarioController extends HttpServlet {
    private final UsuarioService usuarioService = new UsuarioService();
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
                buscaUsuarioPorId(request, response);
                break;
            case "alergias":
                alergias(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoAcao = request.getParameter("acao");
        if (tipoAcao.equals("salvar")) {
            salvar(request, response);
        } else if (tipoAcao.equals("alterar")) {
            alteraUsuario(request, response);
        }
    }

    private void salvar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = new Usuario();
        usuario.setNome(request.getParameter("nome"));
        usuario.setCidade(request.getParameter("cidade"));
        usuario.setUf(request.getParameter("UF"));
        usuario.setNumero(Integer.parseInt(request.getParameter("numero")));
        usuario.setLogradouro(request.getParameter("logradouro"));
        usuario.setSetor(request.getParameter("setor"));
        usuario.setSexo(request.getParameter("sexo").charAt(0));
        usuario.setDataNascimento(FormatterDate.stringToDate(request.getParameter("dataNascimento")));

        Set<Alergia> alergias = new HashSet<>();
        String[] alergiasChecked = request.getParameterValues("alergia");
        if (alergiasChecked != null) {
            for (String alergia : alergiasChecked) {
                Alergia alergiaObj = new Alergia();
                alergiaObj.setId(Long.parseLong(alergia));
                alergias.add(alergiaObj);
            }
        }
        usuario.setAlergia(alergias);

        usuarioService.salvar(usuario);

        request.setAttribute("usuarioSalvo", usuario.getNome());
        listar(request, response);
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> usuarios = usuarioService.buscarTodos();
        request.setAttribute("usuarios", usuarios);

        RequestDispatcher rd = request.getRequestDispatcher("usuario/listarUsuario.jsp");
        rd.forward(request, response);
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Usuario usuario = usuarioService.buscarPorId(id);
        usuarioService.remover(usuario);
        request.setAttribute("usuariuoExcluido", usuario.getNome());
        listar(request, response);
    }

    public void buscaUsuarioPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Usuario usuario = usuarioService.buscarPorId(id);

        List<Alergia> alergias = alergiaService.buscarTodos();

        request.setAttribute("alergias", alergias);
        request.setAttribute("usuario", usuario);

        RequestDispatcher rd = request.getRequestDispatcher("usuario/editarUsuario.jsp");
        rd.forward(request, response);
    }

    public void alteraUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Usuario usuario = usuarioService.buscarPorId(id);
        usuario.setNome(request.getParameter("nome"));
        usuario.setCidade(request.getParameter("cidade"));
        usuario.setUf(request.getParameter("UF"));
        usuario.setNumero(Integer.parseInt(request.getParameter("numero")));
        usuario.setLogradouro(request.getParameter("logradouro"));
        usuario.setSetor(request.getParameter("setor"));
        usuario.setSexo(request.getParameter("sexo").charAt(0));
        usuario.setDataNascimento(FormatterDate.stringToDate(request.getParameter("dataNascimento")));

        Set<Alergia> alergias = new HashSet<>();
        String[] alergiasChecked = request.getParameterValues("alergia");
        if (alergiasChecked != null) {
            for (String alergia : alergiasChecked) {
                Alergia alergiaObj = alergiaService.buscarPorId(Long.parseLong(alergia));
                alergias.add(alergiaObj);
            }
        }
        usuario.setAlergia(alergias);

        usuarioService.atualizar(usuario);
        listar(request, response);
    }

    public void alergias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Set<Alergia> alergias = usuarioService.buscarPorId(id).getAlergia();
        request.setAttribute("alergias", alergias);
        request.setAttribute("nome", usuarioService.buscarPorId(id).getNome());
        RequestDispatcher rd = request.getRequestDispatcher("usuario/listaAlergiaUsuario.jsp");
        rd.forward(request, response);
    }
}
