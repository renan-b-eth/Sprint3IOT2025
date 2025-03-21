package com.odontoprev.web.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "ODONTO_ENDERECO")
@Data
public class OdontoEndereco {
    @Id
    @Column(name = "ID_ENDERECO")
    private Long idEndereco;

    @Column(name = "LOGRADOURO")
    private String logradouro;

    @Column(name = "NUMERO")
    private String numero;

    @Column(name = "COMPLEMENTO")
    private String complemento;

    @Column(name = "BAIRRO")
    private String bairro;

    @Column(name = "CIDADE")
    private String cidade;

    @Column(name = "ESTADO")
    private String estado;

    @Column(name = "CEP")
    private String cep;
}