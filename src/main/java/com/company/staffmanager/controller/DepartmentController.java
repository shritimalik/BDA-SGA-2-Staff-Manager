package com.company.staffmanager.controller;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("departments", departmentService.getAllDepartments());
        return "department-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("department", new Department());
        return "add-department";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Department department,
                      RedirectAttributes redirectAttributes) {
        String result = departmentService.saveDepartment(department);
        if (result.startsWith("ERROR")) {
            redirectAttributes.addFlashAttribute("errorMessage", result);
            return "redirect:/departments/add";
        }
        redirectAttributes.addFlashAttribute("successMessage", "Department added successfully.");
        return "redirect:/departments/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("department", departmentService.getDepartmentById(id));
        return "edit-department";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Department department,
                         RedirectAttributes redirectAttributes) {
        String result = departmentService.updateDepartment(department);
        if (result.startsWith("ERROR")) {
            redirectAttributes.addFlashAttribute("errorMessage", result);
            return "redirect:/departments/edit/" + department.getId();
        }
        redirectAttributes.addFlashAttribute("successMessage", "Department updated successfully.");
        return "redirect:/departments/list";
    }
}