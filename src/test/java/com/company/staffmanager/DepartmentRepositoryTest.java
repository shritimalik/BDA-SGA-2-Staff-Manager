package com.company.staffmanager;

import com.company.staffmanager.entity.Department;
import com.company.staffmanager.repository.DepartmentRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
public class DepartmentRepositoryTest {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    public void testSaveAndFindDepartment() {
        Department dept = new Department("TestDept", "Remote");
        departmentRepository.save(dept);
        
        Optional<Department> found = departmentRepository.findByName("TestDept");
        assertThat(found).isPresent();
        assertThat(found.get().getLocation()).isEqualTo("Remote");
        departmentRepository.delete(dept);
    }

    @Test
    public void testFindByNameNotFound() {
        Optional<Department> found = departmentRepository.findByName("DoesNotExist_12345");
        assertThat(found).isEmpty();
    }

    @Test
    public void testFindAll() {
        Department dept1 = new Department("TestDeptA", "City A");
        Department dept2 = new Department("TestDeptB", "City B");
        departmentRepository.save(dept1);
        departmentRepository.save(dept2);
        
        assertThat(departmentRepository.findAll().size()).isGreaterThanOrEqualTo(2);
        departmentRepository.delete(dept1);
        departmentRepository.delete(dept2);
    }
}