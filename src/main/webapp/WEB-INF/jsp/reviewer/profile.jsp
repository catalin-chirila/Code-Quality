<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/reviewer/profile.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto">
            <li class="nav-item">
                <a class="nav-link underline" href="/reviewer/home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link underline" href="/reviewer/requests/create">Create Review Request</a>
            </li>
            <li class="nav-item">
                <a class="nav-link underline" href="/reviewer/requests/open/all">Check Open Requests</a>
            </li>
            <li class="nav-item">
                <a class="nav-link underline" href="/reviewer/requests/closed/all">Check Closed Requests</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">Edit Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link underline" href="/logout">Log Out</a>
            </li>
        </ul>
    </div>
</nav>

<div class="row justify-content-center align-items-center">
    <form:form class="col-md-6 col-sm-12" action="/reviewer/edit" method="POST" modelAttribute="updateUser">
        <div class="form-group">
            <form:label for="username" path="username">Username</form:label>
            <form:input type="text" class="form-control form-control-lg" id="username" path="username"
                        placeholder="${currentUser.username}" name="username" minlength="5" maxlength="20"></form:input>
           	<c:if test = "${not empty usernameerror}">
        		<p class="error">${usernameerror}</p>
     	   	</c:if>
        </div>

        <div class="form-group">
        	<form:label for="email" path="email">Email</form:label>
        	<form:input type="email" class="form-control form-control-lg" id="email" path="email"
                        placeholder="${currentUser.email}" name="email"></form:input>
            <c:if test = "${not empty emailerror}">
        		<p class="error">${emailerror}</p>
     	   	</c:if>
        </div>

        <div class="form-group">
            <form:label for="passwordHash" path="passwordHash">Password</form:label>
            <form:input type="password" class="form-control form-control-lg" id="passwordHash" path="passwordHash"
                        placeholder="Enter a new password.." name="passwordHash"></form:input>
        </div>

        <c:choose>
            <c:when test="${empty currentUser.firstName}">
                <div class="form-group">
                    <form:label for="firstName" path="firstName">First Name</form:label>
                    <form:input type="text" class="form-control form-control-lg" id="firstName" path="firstName"
                                placeholder="Enter your first name.." name="firstName"></form:input>
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <form:label for="firstName" path="firstName">Last Name</form:label>
                    <form:input type="text" class="form-control form-control-lg" id="firstName" path="firstName"
                                placeholder="${currentUser.firstName}" name="firstName"></form:input>
                </div>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty currentUser.lastName}">
                <div class="form-group">
                    <form:label for="lastName" path="lastName">First Name</form:label>
                    <form:input type="text" class="form-control form-control-lg" id="lastName" path="lastName"
                                placeholder="Enter your last name.." name="lastName"></form:input>
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <form:label for="lastName" path="lastName">First Name</form:label>
                    <form:input type="text" class="form-control form-control-lg" id="lastName" path="lastName"
                                placeholder="${currentUser.lastName}" name="lastName"></form:input>
                </div>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty currentUser.bio}">
                <div class="form-group">
                    <form:label for="bio" path="bio">Bio</form:label>
                    <form:textarea class="form-control form-control-lg" id="bio" path="bio" placeholder="Enter bio.."
                                   rows="3" name="bio"></form:textarea>
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <form:label for="bio" path="bio">Bio</form:label>
                    <form:textarea class="form-control form-control-lg" id="bio" path="bio"
                                   placeholder="${currentUser.bio}" rows="3" name="bio"></form:textarea>
                </div>
            </c:otherwise>
        </c:choose>

        <form:button type="submit" class="btn btn-success btn-lg btn-block">Edit Profile</form:button>
    </form:form>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>