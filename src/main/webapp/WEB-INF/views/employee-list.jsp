<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<div class="top-bar">
    <a class="brand" href="/">Staff Manager</a>
    <nav>
        <a href="/">Home</a>
        <a href="/departments/list">Departments</a>
    </nav>
</div>

<div class="content-wide">

    <div class="content-header">
        <h2>Employees</h2>
        <div>
            <a href="/employees/with-departments" class="btn-link">Full Report</a>
            <a href="/employees/add" class="btn-link">+ Add Employee</a>
        </div>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Job Title</th>
                <th>Department</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="emp" items="${employees}">
                <tr>
                    <td class="td-id">${emp.id}</td>
                    <td class="td-bold">${emp.name}</td>
                    <td class="td-muted">${emp.email}</td>
                    <td><span class="tag">${emp.jobTitle}</span></td>
                    <td>${emp.department.name}</td>
                    <td><a href="/employees/edit/${emp.id}" class="action-link">Edit</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>