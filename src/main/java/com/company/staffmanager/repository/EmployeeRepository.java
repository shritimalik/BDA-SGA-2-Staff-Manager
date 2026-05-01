package com.company.staffmanager.repository;

import com.company.staffmanager.dto.EmployeeDepartmentDTO;
import com.company.staffmanager.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    Optional<Employee> findByEmail(String email);

    @Query("SELECT new com.company.staffmanager.dto.EmployeeDepartmentDTO(" +
           "e.name, e.email, e.jobTitle, d.name, d.location) " +
           "FROM Employee e INNER JOIN e.department d")
    List<EmployeeDepartmentDTO> findAllEmployeesWithDepartments();
}