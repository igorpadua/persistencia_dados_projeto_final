package com.igor.agenda_vacinacao.service;

import com.igor.agenda_vacinacao.dao.AgendaDAO;
import com.igor.agenda_vacinacao.model.Agenda;
import com.igor.agenda_vacinacao.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class AgendaService {
    EntityManager em = JPAUtil.getFactory();
    private final AgendaDAO dao = new AgendaDAO(em);

    public void salvar(Agenda agenda) {
        em.getTransaction().begin();
        dao.salvar(agenda);
        em.getTransaction().commit();
    }

    public void atualizar(Agenda agenda) {
        em.getTransaction().begin();
        dao.atualizar(agenda);
        em.getTransaction().commit();
    }

    public void remover(Agenda agenda) {
        em.getTransaction().begin();
        dao.remover(agenda);
        em.getTransaction().commit();
    }

    public Agenda buscarPorId(Long id) {
        em.getTransaction().begin();
        Agenda agenda = dao.buscarPorId(id);
        em.getTransaction().commit();
        return agenda;
    }

    public List<Agenda> buscarTodos() {
        em.getTransaction().begin();
        List<Agenda> agendas = dao.buscarTodos();
        em.getTransaction().commit();
        return agendas;
    }
}
