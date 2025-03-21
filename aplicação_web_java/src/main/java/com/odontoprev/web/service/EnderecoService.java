package com.odontoprev.web.service;

import com.odontoprev.web.entity.OdontoEndereco;
import com.odontoprev.web.repository.OdontoEnderecoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnderecoService {

    @Autowired
    private OdontoEnderecoRepository enderecoRepository;

    public List<OdontoEndereco> findAll() {
        return enderecoRepository.findAll();
    }

    public OdontoEndereco findById(Long id) {
        return enderecoRepository.findById(id).orElse(null);
    }
}