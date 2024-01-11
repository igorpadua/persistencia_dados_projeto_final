package com.igor.agenda_vacinacao.model;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "alergias")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Alergia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    @ManyToMany(mappedBy = "alergia")
    private Set<Usuario> usuario;
}
