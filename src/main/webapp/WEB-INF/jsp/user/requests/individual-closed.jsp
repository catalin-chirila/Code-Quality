<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Individual Review Request</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/css/user/individual.css">
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
				<a class="nav-link underline" href="/user/home">&lt;Go Back</a>
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
	
	<c:choose>
		<c:when test="${individualRequest.isBroken==true}">			    					
			<div class="col-md-7 col-sm-12 requestBox">
	        <p class="cardTitle">${individualRequest.title} (<span id="broken">Broken</span>)</p>
            <p>
                ${individualRequest.description}
            </p>
            <p>
                Repository Link: <a target="_blank" href="${individualRequest.repositoryLink}">Here</a>
	        </p>	   
		</div>					
	    </c:when>    
	    <c:otherwise>	
	    	<div class="col-md-7 col-sm-12 requestBox">
	        <p class="cardTitle">${individualRequest.title} (<span id="solved">Solved</span>)</p>
            <p>
                ${individualRequest.description}
            </p>
            <p>
                Repository Link: <a target="_blank" href="${individualRequest.repositoryLink}">Here</a>
	        </p>	   
		</div>	
		</c:otherwise>
	</c:choose>
		
	</div>

</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>