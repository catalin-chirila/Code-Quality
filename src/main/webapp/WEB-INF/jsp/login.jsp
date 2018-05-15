<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/login.css">
	
</head>
<body>

<div class="row justify-content-center align-items-center">
	<form class="col-lg-3 col-md-5 col-sm-7 col-9" method="POST" action="${contextPath}/login">
	  <div class="form-group ${error != null ? 'has-error' : ''}">
	  	<span>${message}</span> 
	    <label for="username">Username</label>
	    <input type="text" class="form-control form-control-lg" id="username"  placeholder="Enter Username.." name="username"></input>
	  </div>
	  
	  <div class="form-group ${error != null ? 'has-error' : ''}">
	    <label for="password">Password</label>
	    <input type="password" class="form-control form-control-lg" id="password"  placeholder="Enter Password.." name="password"></input>
	  </div>
	  <span>${error}</span> 
	
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	  <button type="submit" class="btn btn-primary btn-lg btn-block">Log In</button>
	  <button type="button" class="btn btn-success btn-lg btn-block">Sign Up</button>
	  <!-- <a href="/register" class="btn btn-success btn-lg btn-block">Test</a> -->
	</form>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>