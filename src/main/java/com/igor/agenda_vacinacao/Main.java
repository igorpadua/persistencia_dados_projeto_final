package com.igor.agenda_vacinacao;

import com.igor.agenda_vacinacao.model.Usuario;
import com.igor.agenda_vacinacao.service.UsuarioService;

public class Main {
    public static void main(String[] args) {
        Usuario usuario = new Usuario();
        usuario.setNome("Igor");
        usuario.setCidade("Goiânia");
        usuario.setUf("GO");
        usuario.setNumero(123);
        usuario.setLogradouro("Rua 1");
        usuario.setSetor("Setor 1");
        usuario.setSexo('M');
        usuario.setDataNascimento(new java.util.Date());

        UsuarioService usuarioService = new UsuarioService();
        usuarioService.salvar(usuario);
    }
}
