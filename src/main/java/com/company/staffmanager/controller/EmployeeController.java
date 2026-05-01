package com.company.staffmanager.controller;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.entity.Employee;
import com.company.staffmanager.service.DepartmentService;
import com.company.staffmanager.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "employee-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("employee", new Employee());
        model.addAttribute("departments", departmentService.getAllDepartments());
        return "add-employee";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Employee employee,
                      @RequestParam("departmentId") Long departmentId,
                      RedirectAttributes redirectAttributes) {
        Department dept = departmentService.getDepartmentById(departmentId);
        employee.setDepartment(dept);
        String result = employeeService.saveEmployee(employee);
        if (result.startsWith("ERROR")) {
            redirectAttributes.addFlashAttribute("errorMessage", result);
            return "redirect:/employees/add";
        }
        redirectAttributes.addFlashAttribute("successMessage", "Employee added successfully.");
        return "redirect:/employees/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("employee", employeeService.getEmployeeById(id));
        model.addAttribute("departments", departmentService.getAllDepartments());
        return "edit-employee";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Employee employee,
                         @RequestParam("departmentId") Long departmentId,
                         RedirectAttributes redirectAttributes) {
        Department dept = departmentService.getDepartmentById(departmentId);
        employee.setDepartment(dept);
        String result = employeeService.updateEmployee(employee);
        if (result.startsWith("ERROR")) {
            redirectAttributes.addFlashAttribute("errorMessage", result);
            return "redirect:/employees/edit/" + employee.getId();
        }
        redirectAttributes.addFlashAttribute("successMessage", "Employee updated successfully.");
        return "redirect:/employees/list";
    }

    @GetMapping("/with-departments")
    public String withDepartments(Model model) {
        model.addAttribute("employeeDeptList", employeeService.getEmployeesWithDepartments());
        return "employee-department-list";
    }
}