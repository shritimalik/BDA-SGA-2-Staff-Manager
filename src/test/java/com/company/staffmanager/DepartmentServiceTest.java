package com.company.staffmanager;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.repository.DepartmentRepository;
import com.company.staffmanager.service.DepartmentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

public class DepartmentServiceTest {

    @Mock
    private DepartmentRepository departmentRepository;

    @InjectMocks
    private DepartmentService departmentService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetAllDepartments() {
        when(departmentRepository.findAll()).thenReturn(
            Arrays.asList(new Department("HR", "NYC"), new Department("Legal", "LA"))
        );
        List<Department> result = departmentService.getAllDepartments();
        assertThat(result.size()).isEqualTo(2);
        verify(departmentRepository, times(1)).findAll();
    }

    @Test
    public void testSaveDepartment_Success() {
        Department dept = new Department("Operations", "Chicago");
        when(departmentRepository.findByName("Operations")).thenReturn(Optional.empty());
        when(departmentRepository.save(any(Department.class))).thenReturn(dept);
        assertThat(departmentService.saveDepartment(dept)).isEqualTo("SUCCESS");
    }

    @Test
    public void testSaveDepartment_DuplicateName_ReturnsError() {
        Department existing = new Department("Operations", "Chicago");
        existing.setId(1L);
        Department incoming = new Department("Operations", "Dallas");
        when(departmentRepository.findByName("Operations")).thenReturn(Optional.of(existing));
        assertThat(departmentService.saveDepartment(incoming)).startsWith("ERROR");
    }
}