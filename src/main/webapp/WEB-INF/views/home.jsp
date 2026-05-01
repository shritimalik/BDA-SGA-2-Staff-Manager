<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Manager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<div class="top-bar">
    <a class="brand" href="/">Staff Manager</a>
</div>

<div class="content">
    <h1>Employee Management System</h1>
    <br><br>

    <div class="nav-grid">
        <div class="nav-cell">
            <h3>Departments</h3>
            <a href="/departments/list">View all departments</a>
            <a href="/departments/add">Add department</a>
        </div>
        <div class="nav-cell">
            <h3>Employees</h3>
            <a href="/employees/list">View all employees</a>
            <a href="/employees/add">Add employee</a>
        </div>
        <div class="nav-cell">
            <h3>Reports</h3>
            <a href="/employees/with-departments">Employees with departments</a>
        </div>
    </div>
</div>

</body>
</html>