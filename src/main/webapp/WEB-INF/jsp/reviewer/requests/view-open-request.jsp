<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Open Review Request</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/reviewer/view-open-request.css">
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
                <a class="nav-link underline" href="/reviewer/requests/open/all">&lt;Go Back</a>
            </li>

        </ul>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6 col-sm-12">
            <h2 id="pageTitle">Individual Review Request</h2>
        </div>
    </div>

    <div class="row justify-content-center align-items-center">
        <div class="col-md-7 col-sm-12 requestBox">
            <p class="cardTitle">${individualRequest.title} (<span id="needReview">Need Review</span>)</p>
            <p>
                ${individualRequest.description}
            </p>
            <p>
                Repository Link: <a target="_blank" href="${individualRequest.repositoryLink}">Here</a>
            </p>
        </div>
    </div>


    <div class="row justify-content-center align-items-center" id="feedback">
        <div class="col-md-7 col-sm-12 requestBox">
            <form:form action="/update/request/${individualRequest.id}" method="POST"
                       modelAttribute="individualRequest">
                <div class="form-group">
                    <form:label for="reviewerFeedback" path="reviewerFeedback">Feedback</form:label>
                    <form:textarea class="form-control form-control-lg" id="reviewerFeedback" path="reviewerFeedback"
                                   placeholder="Feedback.." rows="3" name="description"
                                   required="required"></form:textarea>                  
                </div>

                <form:button type="submit" class="btn btn-success btn-lg btn-block">Submit Feedback</form:button>
                <form:button id="isBroken" type="submit" class="btn btn-danger btn-lg btn-block" name="isBroken"
                             path="isBroken" value="true">Mark Request As Broken</form:button>
            </form:form>
        </div>
    </div>
</div>


<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>