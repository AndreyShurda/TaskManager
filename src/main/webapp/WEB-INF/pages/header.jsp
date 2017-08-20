<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

    <!-- Access the bootstrap Css like this,
        Spring boot will handle the resource mapping automcatically -->
    <link href="http://cdn.jsdelivr.net/webjars/bootstrap/3.3.7/css/bootstrap.min.css"
          href="@{/webjars/bootstrap/3.3.7/css/bootstrap.min.css}"
          rel="stylesheet" media="screen"/>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
    <c:url value="/css/main.css" var="jstlCss" />
    <link href="${jstlCss}" rel="stylesheet" />

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container">
        <%--<div class="navbar-header">--%>
            <%--<a class="navbar-brand" href="#">Spring Boot</a>--%>
        <%--</div>--%>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li><a  href="/tasks">Tasks</a></li>
                <li><a  href="/task/new">Create new task</a></li>
                <li><a  href="/about">About</a></li>
                <li><a  href="/test">Test</a></li>
            </ul>
        </div>
    </div>
</nav>

