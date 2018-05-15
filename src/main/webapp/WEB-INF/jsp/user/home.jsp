<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Welcome</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" href="../../css/home.css">
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
				<a class="nav-link underline" href="/user/requests/create">Add Review Request</a>
			</li>
			<li class="nav-item">
				<a class="nav-link underline" href="/user/requests/closed">Check Closed Requests</a>
			</li>
			<!--<li class="nav-item dropdown">
				<a class="nav-link underline" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Edit Profile </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a id="councilSquare" class="dropdown-item" href="/logout">The Council Square</a>
					<a id="blackChurch" class="dropdown-item" href="${contextPath}/logout">The Black Church</a>
					<a id="defensiveFortifications" class="dropdown-item" href="#">Brasov's Defensive Fortifications</a>
					
				</div>
			</li> -->

			<li class="nav-item">
				<a class="nav-link underline" href="/profile/edit">Edit Profile</a>
			</li>

			<li class="nav-item">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<a class="nav-link underline" href="/logout">Log Out</a>
			</c:if>
			</li>
		</ul>
	</div>
</nav>

<div class="container">
	<div class="row justify-content-center align-items-center">
       <div class="col-md-6 col-sm-12">
           <h2 id="brasov">Open Review Requests</h2>
       </div>
    </div>

	<div class="row justify-content-center align-items-center">
		<c:forEach items="${requests}" var="request">
			<div class="col-md-5 col-sm-12 requestBox">
		        <p class="cardTitle">${request.title}</p>
	            <p>
	                ${request.description}
	            </p>
	            <p>
	                <em>Repository Link:</em> <a target="_blank" href="${request.repositoryLink}">Here</a>
		        </p>
			</div>
		</c:forEach>
	</div>
</div>

<%-- <div class="container">
	
	<c:forEach items="${requests}" var="request">
	    <div class="row justify-content-center align-items-center">
	        <div class="col-md-7 col-sm-12 cardTextSeparated">
	            <p class="cardTitle">${request.title}</p>
	            <p>
	                ${request.description}
	            </p>
	            <p>
	                <em>Repository Link:</em> <a target="_blank" href="${request.repositoryLink}">Here</a>
	            </p>
	        </div>
	    </div>
	</c:forEach>

</div> --%>

<script type="text/javascript" src="../../plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../plugins/popper.min.js"></script>
<script type="text/javascript" src="../../plugins/bootstrap.min.js"></script>

</body>
</html>