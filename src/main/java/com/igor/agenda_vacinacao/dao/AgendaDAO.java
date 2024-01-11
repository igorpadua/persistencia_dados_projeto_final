package com.igor.agenda_vacinacao.dao;

import com.igor.agenda_vacinacao.model.Agenda;

import javax.persistence.EntityManager;
import java.util.List;

public class AgendaDAO {
    private EntityManager manager;

    public AgendaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void salvar(Agenda agenda) {
        this.manager.persist(agenda);
    }

    public void atualizar(Agenda agenda) {
        this.manager.merge(agenda);
    }

    public void remover(Agenda agenda) {
        this.manager.remove(agenda);
    }

    public Agenda buscarPorId(Long id) {
        return this.manager.find(Agenda.class, id);
    }

    public List<Agenda> buscarTodos() {
        return this.manager.createQuery("SELECT a FROM Agenda a", Agenda.class).getResultList();
    }
}
