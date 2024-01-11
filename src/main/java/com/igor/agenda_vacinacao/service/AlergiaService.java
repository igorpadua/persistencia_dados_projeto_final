package com.igor.agenda_vacinacao.service;

import com.igor.agenda_vacinacao.dao.AlergiaDAO;
import com.igor.agenda_vacinacao.model.Alergia;
import com.igor.agenda_vacinacao.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class AlergiaService {
    EntityManager em = JPAUtil.getFactory();
    private final AlergiaDAO dao = new AlergiaDAO(em);

    public void salvar(Alergia alergia) {
        em.getTransaction().begin();
        dao.salvar(alergia);
        em.getTransaction().commit();
    }

    public void atualizar(Alergia alergia) {
        em.getTransaction().begin();
        dao.atualizar(alergia);
        em.getTransaction().commit();
    }

    public void remover(Alergia alergia) {
        em.getTransaction().begin();
        dao.remover(alergia);
        em.getTransaction().commit();
    }

    public Alergia buscarPorId(Long id) {
        em.getTransaction().begin();
        Alergia alergia = dao.buscarPorId(id);
        em.getTransaction().commit();
        return alergia;
    }

    public List<Alergia> buscarTodos() {
        em.getTransaction().begin();
        List<Alergia> alergias = dao.buscarTodos();
        em.getTransaction().commit();
        return alergias;
    }
}
