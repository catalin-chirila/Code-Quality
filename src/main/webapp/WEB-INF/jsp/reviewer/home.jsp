<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/reviewer/home.css">
</head>
<body>

<div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-md-6 col-sm-12">
			<h2 id="pageTitle">Choose an action</h2>
		</div>
	</div>
	<div class="row justify-content-center align-items-center menu-buttons">
		<div class="col-md-6 col-sm-12">
			<a href="/reviewer/requests/create" class="btn btn-success btn-lg btn-block menu">Create a Review Request</a>
			<a href="/reviewer/requests/open/all" class="btn btn-success btn-lg btn-block menu">Check Open Requests</a>
			<a href="/reviewer/requests/closed/all" class="btn btn-success btn-lg btn-block menu">Check Closed Requests</a>
			<a href="/reviewer/profile/edit" class="btn btn-success btn-lg btn-block menu">Edit Profile</a>
			<a href="/logout" class="btn btn-secondary btn-lg btn-block menu">Log Out</a>
		</div>
	</div>
	
</div>

<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>