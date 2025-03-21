package com.odontoprev.web.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "ODONTO_DENTISTA")
@Data
public class OdontoDentista {
    @Id
    @Column(name = "ID_DENTISTA")
    private Long idDentista;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "ESPECIALIDADE")
    private String especialidade;

    @Column(name = "CRO")
    private String cro;

    @Column(name = "TAXA_SINISTROS")
    private Double taxaSinistros;

    @ManyToOne
    @JoinColumn(name = "ID_ENDERECO")
    private OdontoEndereco endereco;

    @Transient
    private List<OdontoScoring> scores;
}