package com.company.staffmanager.service;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    public List<Department> getAllDepartments() {
        return departmentRepository.findAll();
    }

    public Department getDepartmentById(Long id) {
        return departmentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Department not found: " + id));
    }

    public String saveDepartment(Department department) {
        try {
            Optional<Department> existing = departmentRepository.findByName(department.getName());
            if (existing.isPresent()) {
                return "ERROR: A department with this name already exists.";
            }
            departmentRepository.save(department);
            return "SUCCESS";
        } catch (DataIntegrityViolationException e) {
            return "ERROR: " + e.getMostSpecificCause().getMessage();
        }
    }

    public String updateDepartment(Department department) {
        try {
            Optional<Department> existing = departmentRepository.findByName(department.getName());
            if (existing.isPresent() && !existing.get().getId().equals(department.getId())) {
                return "ERROR: This department name is already in use.";
            }
            departmentRepository.save(department);
            return "SUCCESS";
        } catch (DataIntegrityViolationException e) {
            return "ERROR: " + e.getMostSpecificCause().getMessage();
        }
    }
}