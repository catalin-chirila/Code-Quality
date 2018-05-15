<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<link rel="stylesheet" href="../../css/reviewer/individual.css">
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
           <h2 id="brasov">Individual Review Request</h2>
       </div>
    </div>

	<div class="row justify-content-center align-items-center">		
		<div class="col-md-7 col-sm-12 requestBox">
	        <p class="cardTitle">${individualRequest.title}</p>
            <p>
                ${individualRequest.description}
            </p>
            <p>
                <em>Repository Link:</em> <a target="_blank" href="${individualRequest.repositoryLink}">Here</a>
	        </p>
		</div>
	</div>


	<div class="row justify-content-center align-items-center" id="feedback">
		<div class="col-md-7 col-sm-12 requestBox">
		<form:form action="/create-review-request" method="PUT" modelAttribute="individualRequest">
		  <div class="form-group">
		    <form:label for="reviewerFeedback" path="reviewerFeedback">Feedback</form:label>
		    <form:textarea class="form-control form-control-lg" id="reviewerFeedback" path="reviewerFeedback" placeholder="Feedback.." rows="3" name="description"></form:textarea>
		  </div>
		
		  <form:button type="submit" class="btn btn-success btn-lg btn-block">Submit Feedback</form:button>
		  <form:button type="submit" class="btn btn-danger btn-lg btn-block">Mark Request As Broken</form:button>
		</form:form>
		</div>
	</div>
</div>


<script type="text/javascript" src="../../plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../plugins/popper.min.js"></script>
<script type="text/javascript" src="../../plugins/bootstrap.min.js"></script>

</body>
</html>