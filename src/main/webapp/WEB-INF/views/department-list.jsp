<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Departments</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<div class="top-bar">
    <a class="brand" href="/">Staff Manager</a>
    <nav>
        <a href="/">Home</a>
        <a href="/employees/list">Employees</a>
    </nav>
</div>

<div class="content">

    <div class="content-header">
        <h2>Departments</h2>
        <a href="/departments/add" class="btn-link">+ Add Department</a>
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
                <th>Location</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="dept" items="${departments}">
                <tr>
                    <td class="td-id">${dept.id}</td>
                    <td class="td-bold">${dept.name}</td>
                    <td class="td-muted">${dept.location}</td>
                    <td><a href="/departments/edit/${dept.id}" class="action-link">Edit</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>