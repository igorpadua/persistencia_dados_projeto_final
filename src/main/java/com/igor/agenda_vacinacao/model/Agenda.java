package com.igor.agenda_vacinacao.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name = "agendas")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Agenda {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date data;
    private Time hora;
    @Enumerated(EnumType.STRING)
    private Situacao situacao;
    @Column(name = "data_situacao")
    private Date dataSituacao;
    private String observacao;
    @ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;
    @ManyToOne
    @JoinColumn(name = "id_vacina")
    private Vacina vacina;
}
