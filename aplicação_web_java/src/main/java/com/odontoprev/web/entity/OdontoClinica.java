package com.odontoprev.web.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "ODONTO_CLINICA")
@Data
public class OdontoClinica {
    @Id
    @Column(name = "ID_CLINICA")
    private Long idClinica;

    @Column(name = "NOME_CLINICA")
    private String nomeClinica;

    @Column(name = "TIPO_ATENDIMENTO")
    private String tipoAtendimento;

    @ManyToOne
    @JoinColumn(name = "ID_ENDERECO")
    private OdontoEndereco endereco;
}