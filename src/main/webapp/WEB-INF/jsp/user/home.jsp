<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Home</title>
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/user/home.css">
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
            <a href="/user/requests/create" class="btn btn-success btn-lg btn-block menu">Create Review Request</a>
            <a href="/user/requests/open/all" class="btn btn-success btn-lg btn-block menu">Check Open Requests</a>
            <a href="/user/requests/closed/all" class="btn btn-success btn-lg btn-block menu">Check Closed Requests</a>
            <a href="/user/profile/edit" class="btn btn-success btn-lg btn-block menu">Edit Profile</a>
            <a href="/logout" class="btn btn-secondary btn-lg btn-block menu">Log Out</a>
        </div>
    </div>

</div>

<script type="text/javascript" src="${contextPath}/plugins/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/bootstrap.min.js"></script>

</body>
</html>