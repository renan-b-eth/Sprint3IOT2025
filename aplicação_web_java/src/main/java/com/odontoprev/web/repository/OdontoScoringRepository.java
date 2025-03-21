package com.odontoprev.web.repository;

import com.odontoprev.web.entity.OdontoDentista;
import com.odontoprev.web.entity.OdontoScoring;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OdontoScoringRepository extends JpaRepository<OdontoScoring, Long> {
    List<OdontoScoring> findByDentista(OdontoDentista dentista);
}