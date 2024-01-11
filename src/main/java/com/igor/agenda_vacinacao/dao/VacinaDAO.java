package com.igor.agenda_vacinacao.dao;

import com.igor.agenda_vacinacao.model.Vacina;

import javax.persistence.EntityManager;
import java.util.List;

public class VacinaDAO {
    private EntityManager manager;

    public VacinaDAO(EntityManager manager) {
        this.manager = manager;
    }

    public void salvar(Vacina vacina) {
        this.manager.persist(vacina);
    }

    public void atualizar(Vacina vacina) {
        this.manager.merge(vacina);
    }

    public void remover(Vacina vacina) {
        this.manager.remove(vacina);
    }

    public Vacina buscarPorId(Long id) {
        return this.manager.find(Vacina.class, id);
    }

    public List<Vacina> buscarTodos() {
        return this.manager.createQuery("SELECT v FROM Vacina v", Vacina.class).getResultList();
    }

}
