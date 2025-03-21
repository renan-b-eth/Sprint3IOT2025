package com.odontoprev.web.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Entity
@Table(name = "ODONTO_SCORING")
@Data
public class OdontoScoring {
    @Id
    @Column(name = "ID_SCORING")
    private Long idScoring;

    @ManyToOne
    @JoinColumn(name = "ID_DENTISTA")
    private OdontoDentista dentista;

    @Column(name = "SCORING")
    private Double scoring;

    @Column(name = "DATA_AVALIACAO")
    private LocalDate dataAvaliacao;
}