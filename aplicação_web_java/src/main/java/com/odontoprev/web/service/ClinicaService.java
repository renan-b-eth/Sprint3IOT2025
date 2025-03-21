package com.odontoprev.web.service;

import com.odontoprev.web.entity.OdontoClinica;
import com.odontoprev.web.repository.OdontoClinicaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClinicaService {

    @Autowired
    private OdontoClinicaRepository clinicaRepository;

    public List<OdontoClinica> findAll() {
        return clinicaRepository.findAll();
    }

    public OdontoClinica findById(Long id) {
        return clinicaRepository.findById(id).orElse(null);
    }

    public OdontoClinica save(OdontoClinica clinica) {
        return clinicaRepository.save(clinica);
    }

    public void delete(Long id) {
        clinicaRepository.deleteById(id);
    }
}