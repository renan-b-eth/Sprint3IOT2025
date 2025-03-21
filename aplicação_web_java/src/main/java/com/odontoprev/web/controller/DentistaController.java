package com.odontoprev.web.controller;

import com.odontoprev.web.entity.OdontoDentista;
import com.odontoprev.web.service.DentistaService;
import com.odontoprev.web.service.EnderecoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dentistas")
public class DentistaController {

    @Autowired
    private DentistaService dentistaService;

    @Autowired
    private EnderecoService enderecoService;

    // Listar todos os dentistas
    @GetMapping
    public String listDentistas(Model model) {
        model.addAttribute("dentistas", dentistaService.findAll());
        return "dentistas/list";
    }

    // Exibir formulário para criar um novo dentista
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("dentista", new OdontoDentista());
        model.addAttribute("enderecos", enderecoService.findAll());
        return "dentistas/form";
    }

    // Salvar um dentista (criar ou atualizar)
    @PostMapping
    public String saveDentista(@ModelAttribute OdontoDentista dentista) {
        dentistaService.save(dentista);
        return "redirect:/dentistas";
    }

    // Exibir formulário para editar um dentista
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        OdontoDentista dentista = dentistaService.findById(id);
        if (dentista == null) {
            return "redirect:/dentistas";
        }
        model.addAttribute("dentista", dentista);
        model.addAttribute("enderecos", enderecoService.findAll());
        return "dentistas/form";
    }

    // Deletar um dentista
    @GetMapping("/delete/{id}")
    public String deleteDentista(@PathVariable Long id) {
        dentistaService.delete(id);
        return "redirect:/dentistas";
    }
}