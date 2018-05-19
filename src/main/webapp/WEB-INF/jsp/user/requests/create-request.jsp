<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Create Review Request</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<!-- <link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet"> -->
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
		<ul class="navbar-nav mx-auto">
			<li class="nav-item">
				<a class="nav-link underline" href="/user/home">Home</a>
			</li>			
			<li class="nav-item">
				<a class="nav-link active" href="#">Create Review Request</a>
			</li>
			<li class="nav-item">
				<a class="nav-link underline" href="/user/requests/open/all">Check Open Requests</a>
			</li>
			<li class="nav-item">
				<a class="nav-link underline" href="/user/requests/closed/all">Check Closed Requests</a>
			</li>
			<li class="nav-item">
				<a class="nav-link underline" href="/user/profile/edit">Edit Profile</a>
			</li>
			<li class="nav-item">
				<a class="nav-link underline" href="/logout">Log Out</a>		
			</li>
		</ul>
	</div>
</nav>

<div class="row justify-content-center align-items-center">
	<form:form class="col-md-6 col-sm-12" action="/create/request" method="PUT" modelAttribute="reviewRequest">
	  <div class="form-group">
	    <form:label for="title" path="title">Title</form:label>
	    <form:input type="text" class="form-control form-control-lg" id="title" path="title" placeholder="Java Sorting Algorithm" name="title"></form:input>
	  </div>
	  <div class="form-group">
	    <form:label for="description" path="description">Description</form:label>
	    <form:textarea class="form-control form-control-lg" id="description" path="description" placeholder="Description.." rows="3" name="description"></form:textarea>
	  </div>
	  <div class="form-group">
	    <form:label for="repositoryLink" path="repositoryLink">Repository Link</form:label>
	    <form:input type="text" class="form-control form-control-lg" id="repositoryLink" path="repositoryLink" placeholder="https://github.com/user/repositoryname" name="repositoryLink"></form:input>
	  </div>
	  <form:button type="submit" class="btn btn-success btn-lg btn-block">Create Review Request</form:button>
	</form:form>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>