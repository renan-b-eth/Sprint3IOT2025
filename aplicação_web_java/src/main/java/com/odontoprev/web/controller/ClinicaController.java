package com.odontoprev.web.controller;

import com.odontoprev.web.entity.OdontoClinica;
import com.odontoprev.web.service.ClinicaService;
import com.odontoprev.web.service.EnderecoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clinicas")
public class ClinicaController {

    @Autowired
    private ClinicaService clinicaService;

    @Autowired
    private EnderecoService enderecoService;

    // Listar todas as clínicas
    @GetMapping
    public String listClinicas(Model model) {
        model.addAttribute("clinicas", clinicaService.findAll());
        return "clinicas/list";
    }

    // Exibir formulário para criar uma nova clínica
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("clinica", new OdontoClinica());
        model.addAttribute("enderecos", enderecoService.findAll());
        return "clinicas/form";
    }

    // Salvar uma clínica (criar ou atualizar)
    @PostMapping
    public String saveClinica(@ModelAttribute OdontoClinica clinica) {
        clinicaService.save(clinica);
        return "redirect:/clinicas";
    }

    // Exibir formulário para editar uma clínica
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        OdontoClinica clinica = clinicaService.findById(id);
        if (clinica == null) {
            return "redirect:/clinicas";
        }
        model.addAttribute("clinica", clinica);
        model.addAttribute("enderecos", enderecoService.findAll());
        return "clinicas/form";
    }

    // Deletar uma clínica
    @GetMapping("/delete/{id}")
    public String deleteClinica(@PathVariable Long id) {
        clinicaService.delete(id);
        return "redirect:/clinicas";
    }
}