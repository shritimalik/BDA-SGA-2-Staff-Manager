package com.company.staffmanager;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.entity.Employee;
import com.company.staffmanager.repository.EmployeeRepository;
import com.company.staffmanager.service.EmployeeService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

public class EmployeeServiceTest {

    @Mock
    private EmployeeRepository employeeRepository;

    @InjectMocks
    private EmployeeService employeeService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testSaveEmployee_Success() {
        Department dept = new Department("Design", "Berlin");
        Employee emp = new Employee("Alice", "alice@company.com", "Designer", dept);
        when(employeeRepository.findByEmail("alice@company.com")).thenReturn(Optional.empty());
        when(employeeRepository.save(any(Employee.class))).thenReturn(emp);
        assertThat(employeeService.saveEmployee(emp)).isEqualTo("SUCCESS");
    }

    @Test
    public void testSaveEmployee_DuplicateEmail_ReturnsError() {
        Department dept = new Department("Design", "Berlin");
        Employee existing = new Employee("Alice", "alice@company.com", "Designer", dept);
        existing.setId(1L);
        Employee incoming = new Employee("Alice2", "alice@company.com", "Developer", dept);
        when(employeeRepository.findByEmail("alice@company.com")).thenReturn(Optional.of(existing));
        assertThat(employeeService.saveEmployee(incoming)).startsWith("ERROR");
    }

    @Test
    public void testGetEmployeeById() {
        Department dept = new Department("Sales", "Dubai");
        Employee emp = new Employee("Bob", "bob@company.com", "Sales Rep", dept);
        emp.setId(3L);
        when(employeeRepository.findById(3L)).thenReturn(Optional.of(emp));
        assertThat(employeeService.getEmployeeById(3L).getName()).isEqualTo("Bob");
    }
}