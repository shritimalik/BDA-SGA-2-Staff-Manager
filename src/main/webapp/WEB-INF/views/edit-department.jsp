<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
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

<div class="content-narrow">
    <h2>Edit Department</h2>
    <p class="sub">Updating details for <strong>${department.name}</strong>.</p>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <form action="/departments/update" method="post">
        <input type="hidden" name="id" value="${department.id}"/>

        <div class="field">
            <label for="name">Department Name</label>
            <input type="text" id="name" name="name" value="${department.name}" required/>
        </div>

        <div class="field">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" value="${department.location}" required/>
        </div>

        <button type="submit" class="btn-submit">Save Changes</button>
    </form>

    <a href="/departments/list" class="back-link">Back to departments</a>
</div>

</body>
</html>