package com.odontoprev.web.service;

import com.odontoprev.web.entity.OdontoDentista;
import com.odontoprev.web.entity.OdontoScoring;
import com.odontoprev.web.repository.OdontoDentistaRepository;
import com.odontoprev.web.repository.OdontoScoringRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DentistaService {

    @Autowired
    private OdontoDentistaRepository dentistaRepository;

    @Autowired
    private OdontoScoringRepository scoringRepository;

    public List<OdontoDentista> findAll() {
        List<OdontoDentista> dentistas = dentistaRepository.findAll();
        for (OdontoDentista dentista : dentistas) {
            List<OdontoScoring> scores = scoringRepository.findByDentista(dentista);
            dentista.setScores(scores);
        }
        return dentistas;
    }

    public OdontoDentista findById(Long id) {
        OdontoDentista dentista = dentistaRepository.findById(id).orElse(null);
        if (dentista != null) {
            List<OdontoScoring> scores = scoringRepository.findByDentista(dentista);
            dentista.setScores(scores);
        }
        return dentista;
    }

    public OdontoDentista save(OdontoDentista dentista) {
        return dentistaRepository.save(dentista);
    }

    public void delete(Long id) {
        dentistaRepository.deleteById(id);
    }
}