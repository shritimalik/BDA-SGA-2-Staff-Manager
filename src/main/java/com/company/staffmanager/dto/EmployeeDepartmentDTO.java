package com.company.staffmanager.dto;

public class EmployeeDepartmentDTO {

    private String employeeName;
    private String email;
    private String jobTitle;
    private String departmentName;
    private String location;

    public EmployeeDepartmentDTO(String employeeName, String email,
                                  String jobTitle, String departmentName, String location) {
        this.employeeName = employeeName;
        this.email = email;
        this.jobTitle = jobTitle;
        this.departmentName = departmentName;
        this.location = location;
    }

    public String getEmployeeName() { return employeeName; }
    public String getEmail() { return email; }
    public String getJobTitle() { return jobTitle; }
    public String getDepartmentName() { return departmentName; }
    public String getLocation() { return location; }
}