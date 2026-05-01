package com.company.staffmanager.service;

import com.company.staffmanager.dto.EmployeeDepartmentDTO;
import com.company.staffmanager.entity.Employee;
import com.company.staffmanager.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee getEmployeeById(Long id) {
        return employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found: " + id));
    }

    public String saveEmployee(Employee employee) {
        try {
            Optional<Employee> existing = employeeRepository.findByEmail(employee.getEmail());
            if (existing.isPresent()) {
                return "ERROR: An employee with this email already exists.";
            }
            employeeRepository.save(employee);
            return "SUCCESS";
        } catch (DataIntegrityViolationException e) {
            return "ERROR: " + e.getMostSpecificCause().getMessage();
        }
    }

    public String updateEmployee(Employee employee) {
        try {
            Optional<Employee> existing = employeeRepository.findByEmail(employee.getEmail());
            if (existing.isPresent() && !existing.get().getId().equals(employee.getId())) {
                return "ERROR: This email is already used by another employee.";
            }
            employeeRepository.save(employee);
            return "SUCCESS";
        } catch (DataIntegrityViolationException e) {
            return "ERROR: " + e.getMostSpecificCause().getMessage();
        }
    }

    public List<EmployeeDepartmentDTO> getEmployeesWithDepartments() {
        return employeeRepository.findAllEmployeesWithDepartments();
    }
}