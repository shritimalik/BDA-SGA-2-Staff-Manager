<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
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

<div class="content-narrow">
    <h2>Edit Employee</h2>
    <p class="sub">Updating details for <strong>${employee.name}</strong>.</p>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <form action="/employees/update" method="post">
        <input type="hidden" name="id" value="${employee.id}"/>

        <div class="field">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" value="${employee.name}" required/>
        </div>

        <div class="field">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" value="${employee.email}" required/>
        </div>

        <div class="field">
            <label for="jobTitle">Job Title</label>
            <input type="text" id="jobTitle" name="jobTitle" value="${employee.jobTitle}" required/>
        </div>

        <div class="field">
            <label for="departmentId">Department</label>
            <div class="select-wrapper">
                <select id="departmentId" name="departmentId" required>
                    <c:forEach var="dept" items="${departments}">
                        <option value="${dept.id}" ${employee.department.id == dept.id ? 'selected' : ''}>
                            ${dept.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>

    <a href="/employees/list" class="back-link">Back to employees</a>
</div>

</body>
</html>