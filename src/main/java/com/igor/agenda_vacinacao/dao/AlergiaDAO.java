package com.igor.agenda_vacinacao.dao;

import com.igor.agenda_vacinacao.model.Alergia;

import javax.persistence.EntityManager;
import java.util.List;

public class AlergiaDAO {
    private EntityManager manager;

    public AlergiaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void salvar(Alergia alergia) {
        this.manager.persist(alergia);
    }

    public void atualizar(Alergia alergia) {
        this.manager.merge(alergia);
    }

    public void remover(Alergia alergia) {
        this.manager.remove(alergia);
    }

    public Alergia buscarPorId(Long id) {
        return this.manager.find(Alergia.class, id);
    }

    public List<Alergia> buscarTodos() {
        return this.manager.createQuery("SELECT a FROM Alergia a", Alergia.class).getResultList();
    }
}
