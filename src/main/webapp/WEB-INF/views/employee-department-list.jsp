<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employees with Departments</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<div class="top-bar">
    <a class="brand" href="/">Staff Manager</a>
    <nav>
        <a href="/">Home</a>
        <a href="/employees/list">Employees</a>
        <a href="/departments/list">Departments</a>
    </nav>
</div>

<div class="content-wide">

    <div class="content-header">
        <h2>Employees with Departments</h2>
    </div>
    <br><br>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Job Title</th>
                <th>Department</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${employeeDeptList}">
                <tr>
                    <td class="td-bold">${item.employeeName}</td>
                    <td class="td-muted">${item.email}</td>
                    <td><span class="tag">${item.jobTitle}</span></td>
                    <td>${item.departmentName}</td>
                    <td class="td-muted">${item.location}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>