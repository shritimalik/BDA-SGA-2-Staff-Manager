<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
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
    <h2>Add Employee</h2>
    <p class="sub">Fill in the details to add a new employee.</p>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <form action="/employees/add" method="post">

        <div class="field">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="e.g. Rania Khalil" required/>
        </div>

        <div class="field">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="e.g. rania@company.com" required/>
        </div>

        <div class="field">
            <label for="jobTitle">Job Title</label>
            <input type="text" id="jobTitle" name="jobTitle" placeholder="e.g. Software Engineer" required/>
        </div>

        <div class="field">
            <label for="departmentId">Department</label>
            <div class="select-wrapper">
                <select id="departmentId" name="departmentId" required>
                    <option value="">Select a department</option>
                    <c:forEach var="dept" items="${departments}">
                        <option value="${dept.id}">${dept.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <button type="submit" class="btn-submit">Add Employee</button>
    </form>

    <a href="/employees/list" class="back-link">Back to employees</a>
</div>

</body>
</html>