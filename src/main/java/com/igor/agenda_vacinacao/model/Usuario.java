package com.igor.agenda_vacinacao.model;

import lombok.*;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "usuarios")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    @Column(name = "data_nascimento")
    private Date dataNascimento;
    private char sexo;
    private String logradouro;
    private Integer numero;
    private String setor;
    private String cidade;
    private String uf;
    @ManyToMany
    @JoinTable(
            name = "usuarios_alergias",
            joinColumns = @JoinColumn(name = "id_usuario"),
            inverseJoinColumns = @JoinColumn(name = "id_alergia")
    )
    private Set<Alergia> alergia;
}
