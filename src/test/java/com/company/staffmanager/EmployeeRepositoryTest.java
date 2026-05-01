package com.company.staffmanager;

import com.company.staffmanager.dto.EmployeeDepartmentDTO;
import com.company.staffmanager.entity.Department;
import com.company.staffmanager.entity.Employee;
import com.company.staffmanager.repository.DepartmentRepository;
import com.company.staffmanager.repository.EmployeeRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
public class EmployeeRepositoryTest {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    public void testSaveAndFindEmployee() {
        Department dept = departmentRepository.save(new Department("IT_Test", "London"));
        Employee emp = new Employee("Test User", "test@test.com", "Analyst", dept);
        employeeRepository.save(emp);
        
        Optional<Employee> found = employeeRepository.findByEmail("test@test.com");
        assertThat(found).isPresent();
        assertThat(found.get().getName()).isEqualTo("Test User");
        
        employeeRepository.delete(emp);
        departmentRepository.delete(dept);
    }

    @Test
    public void testFindByEmailNotFound() {
        Optional<Employee> found = employeeRepository.findByEmail("nobody_12345@test.com");
        assertThat(found).isEmpty();
    }

    @Test
    public void testInnerJoinQuery() {
        Department dept = departmentRepository.save(new Department("Finance_Test", "Paris"));
        Employee emp = new Employee("Join Test", "join@test.com", "Accountant", dept);
        employeeRepository.save(emp);
        
        List<EmployeeDepartmentDTO> result = employeeRepository.findAllEmployeesWithDepartments();
        assertThat(result).isNotEmpty();
        
        employeeRepository.delete(emp);
        departmentRepository.delete(dept);
    }
}