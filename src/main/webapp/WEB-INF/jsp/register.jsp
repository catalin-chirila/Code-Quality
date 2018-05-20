<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/register.css">
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
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link underline" href="/login">&lt;Go To Login</a>
			</li>
		</ul>
	</div>
</nav>

<div class="row justify-content-center align-items-center">
	<form:form class="col-md-6 col-sm-12" action="/create/user" method="POST" modelAttribute="user">
	  <div class="form-group">
	    <form:label for="username" path="username">Username</form:label>
	    <form:input type="text" class="form-control form-control-lg" id="username" path="username" placeholder="Enter username.." name="username"></form:input>
	    <form:errors path="username" cssClass="error" />
	  </div>
	  <div class="form-group">
	    <form:label for="email" path="email">Email</form:label>
	    <form:input type="email" class="form-control form-control-lg" id="email" path="email" placeholder="Enter email.." name="mail"></form:input>
	    <form:errors path="email" cssClass="error"/>
	  </div>	  
	  
	  <div class="form-group">
	    <form:label for="passwordHash" path="passwordHash">Password</form:label>
	    <form:input type="password" class="form-control form-control-lg" id="passwordHash" path="passwordHash" placeholder="Enter password.." name="passwordHash"></form:input>
	    <form:errors path="passwordHash" cssClass="error"/>
	  </div>
	  
	   <div class="form-group">
	    <label for="role" >Register as</label>
	    <select class="form-control form-control-lg" id="role" name="role">
	    	<option value="USER">User</option>
	    	<option value="REVIEWER">Reviewer</option>
	    </select>
	  </div>
	  

	  <form:button type="submit" class="btn btn-success btn-lg btn-block">Register</form:button>
	</form:form>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>