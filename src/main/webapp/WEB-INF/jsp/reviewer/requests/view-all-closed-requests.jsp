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
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/reviewer/view-all-closed-requests.css">
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
           <h2 id="brasov">Closed Review Requests</h2>
       </div>
    </div>

	<div class="row justify-content-center h-100">
		<c:forEach items="${requests}" var="request">
			<c:choose>
			    <c:when test="${request.isBroken==true}">			    					
					<a class="col-md-5 col-sm-12 requestBox requestLink" id="linkRequestBox" href="/requests/individual/closed/${request.id}">			
			      		<span class="cardTitle">${request.title} (<span id="broken">Broken</span>)</span>				
					</a>						
			    </c:when>    
			    <c:otherwise>	
					<a class="col-md-5 col-sm-12 requestBox requestLink" id="linkRequestBox" href="/requests/individual/closed/${request.id}">			
			      		<span class="cardTitle">${request.title} (<span id="solved">Solved</span>)</span>				
					</a>	
			    </c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>



<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>