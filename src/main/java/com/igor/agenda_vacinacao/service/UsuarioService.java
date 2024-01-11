package com.igor.agenda_vacinacao.service;

import com.igor.agenda_vacinacao.dao.UsuarioDAO;
import com.igor.agenda_vacinacao.model.Usuario;
import com.igor.agenda_vacinacao.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class UsuarioService {
    EntityManager em = JPAUtil.getFactory();
    private final UsuarioDAO dao = new UsuarioDAO(em);

    public void salvar(Usuario usuario) {
        em.getTransaction().begin();
        dao.salvar(usuario);
        em.getTransaction().commit();
    }

    public void atualizar(Usuario usuario) {
        em.getTransaction().begin();
        dao.atualizar(usuario);
        em.getTransaction().commit();
    }

    public void remover(Usuario usuario) {
        em.getTransaction().begin();
        dao.remover(usuario);
        em.getTransaction().commit();
    }

    public Usuario buscarPorId(Long id) {
        em.getTransaction().begin();
        Usuario usuario = dao.buscarPorId(id);
        em.getTransaction().commit();
        return usuario;
    }

    public List<Usuario> buscarTodos() {
        em.getTransaction().begin();
        List<Usuario> usuarios = dao.buscarTodos();
        em.getTransaction().commit();
        return usuarios;
    }
}
