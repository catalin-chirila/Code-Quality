<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Create Review Request</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/user/create-request.css">
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
				<a class="nav-link underline" href="/login">Login</a>
			</li>
		</ul>
	</div>
</nav>

<div class="row justify-content-center align-items-center">
	<form:form class="col-md-6 col-sm-12" action="/create/user" method="PUT" modelAttribute="user">
	  <div class="form-group">
	    <form:label for="username" path="username">Username</form:label>
	    <form:input type="text" class="form-control form-control-lg" id="username" path="username" placeholder="Some username.." name="username"></form:input>
	  </div>
	  <div class="form-group">
	    <form:label for="email" path="email">Email</form:label>
	    <form:input type="email" class="form-control form-control-lg" id="email" path="email" placeholder="Some email.." name="mail"></form:input>
	  </div>
	  
	  <div class="form-group">
	    <label for="role" >Role</label>
	    <input type="role" class="form-control form-control-lg" id="role" placeholder="Role.." name="role"></input>
	  </div>
	  
	  <!-- <select class="form-control" id="tripSelect"> </select> -->
	  
	  
	  
	  
	  
	  
	  <div class="form-group">
	    <form:label for="passwordHash" path="passwordHash">Password</form:label>
	    <form:input type="password" class="form-control form-control-lg" id="passwordHash" path="passwordHash" placeholder="Some password.." name="passwordHash"></form:input>
	  </div>
	  <form:button type="submit" class="btn btn-secondary btn-lg btn-block">Submit</form:button>
	</form:form>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>