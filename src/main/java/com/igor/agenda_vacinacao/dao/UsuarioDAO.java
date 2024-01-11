package com.igor.agenda_vacinacao.dao;

import com.igor.agenda_vacinacao.model.Usuario;

import javax.persistence.EntityManager;
import java.util.List;

public class UsuarioDAO {
    private EntityManager manager;

    public UsuarioDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void salvar(Usuario usuario) {
        this.manager.persist(usuario);
    }

    public void atualizar(Usuario usuario) {
        this.manager.merge(usuario);
    }

    public void remover(Usuario usuario) {
        this.manager.remove(usuario);
    }

    public Usuario buscarPorId(Long id) {
        return this.manager.find(Usuario.class, id);
    }

    public List<Usuario> buscarTodos() {
        return this.manager.createQuery("SELECT u FROM Usuario u", Usuario.class).getResultList();
    }
}
