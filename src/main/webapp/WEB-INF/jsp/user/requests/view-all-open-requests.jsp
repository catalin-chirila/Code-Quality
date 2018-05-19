<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/user/view-all-open-requests.css">
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
				<a class="nav-link underline" href="/user/requests/create">Add Review Request</a>
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

<div class="container">
	<div class="row justify-content-center align-items-center">
       <div class="col-md-6 col-sm-12">
           <h2 id="pageTitle">Open Review Requests</h2>
       </div>
    </div>

	<div class="row justify-content-center">
		<c:choose>
			<c:when test="${empty requests}">	
				<div class="col-md-6 col-sm-12">
           			<h2 id="error-message">There aren't any open requests yet..</h2>
      			</div>		    										
			</c:when>    
			    <c:otherwise>	
					<c:forEach items="${requests}" var="request">					
						<a class="col-md-5 col-sm-12 requestBox requestLink" id="linkRequestBox" href="/user/request/open/${request.id}">			
			     		 <span class="cardTitle">${request.title} (<span id="needReview">Need Review</span>)</span>				
						</a>	
					</c:forEach>	
			    </c:otherwise>
		</c:choose>
	</div>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>