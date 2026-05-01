<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Department</title>
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
    <h2>Add Department</h2>
    <p class="sub">Fill in the details to create a new department.</p>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <form action="/departments/add" method="post">

        <div class="field">
            <label for="name">Department Name</label>
            <input type="text" id="name" name="name" placeholder="e.g. Engineering" required/>
        </div>

        <div class="field">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" placeholder="e.g. New York" required/>
        </div>

        <button type="submit" class="btn-submit">Add Department</button>
    </form>

    <a href="/departments/list" class="back-link">Back to departments</a>
</div>

</body>
</html>