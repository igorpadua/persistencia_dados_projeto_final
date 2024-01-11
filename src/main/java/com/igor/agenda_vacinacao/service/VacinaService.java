package com.igor.agenda_vacinacao.service;

import com.igor.agenda_vacinacao.dao.VacinaDAO;
import com.igor.agenda_vacinacao.model.Vacina;
import com.igor.agenda_vacinacao.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class VacinaService {
    EntityManager em = JPAUtil.getFactory();
    private final VacinaDAO dao = new VacinaDAO(em);

    public void salvar(Vacina vacina) {
        em.getTransaction().begin();
        dao.salvar(vacina);
        em.getTransaction().commit();
    }

    public void atualizar(Vacina vacina) {
        em.getTransaction().begin();
        dao.atualizar(vacina);
        em.getTransaction().commit();
    }

    public void remover(Vacina vacina) {
        em.getTransaction().begin();
        dao.remover(vacina);
        em.getTransaction().commit();
    }

    public Vacina buscarPorId(Long id) {
        em.getTransaction().begin();
        Vacina vacina = dao.buscarPorId(id);
        em.getTransaction().commit();
        return vacina;
    }

    public List<Vacina> buscarTodos() {
        em.getTransaction().begin();
        List<Vacina> vacinas = dao.buscarTodos();
        em.getTransaction().commit();
        return vacinas;
    }
}
