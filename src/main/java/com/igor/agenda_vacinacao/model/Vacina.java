package com.igor.agenda_vacinacao.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "vacinas")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Vacina {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titulo;
    private String descricao;
    private Integer doses;
    private Integer periodicidade;
    private Integer intervalo;
}
