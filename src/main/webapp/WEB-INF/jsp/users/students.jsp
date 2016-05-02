<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student</title>
</head>

<body >

<div class="row" style="background-color: black">
	<div class="col-md-4 col-md-offset-4" >
		<img src="banner.png" style='height: 100%; width: 100%; object-fit: contain'/>
	</div>
	<div class="col-md-1 col-md-offset-1">
		<h3 ><a href="students.html" style="color:white" >Home</a></h3>
	</div>
	<div class="col-md-1">
		<h3><a href="logout.html" style="color:white">Logout</a></h3>
	</div>
</div>

<hr / style="border: solid black 1px">

<div class="row">
	
	<div class="col-md-3" >
		<h2 class="col-md-offset-1 " style="text-align: center;">Begin <br /> New Application <br />Here</h2>
			<a class="btn btn-danger col-md-offset-4" style="margin-top: 10%" href="newApplication.html" role="button">Apply Here</a>

	</div>
	<div class="col-md-7">
		<h3 style="font-family:sans-serif ;">Your Applications ${currentUser.lname}, ${currentUser.fname}</h3>
		<table class="table table-striped" style="text-align: center;font-family: fantasy;font-size:large;font-weight: bold;">
			<tr>
			<th>Application ID</th><th>Applied date</th><th>Department</th><th>Program</th><th>Term</th><th>Current Status</th>
			</tr>
			<c:forEach items="${studentApplications}" var="application">
			
			<tr><td><a href="viewApplication.html?id=${application.application_id}">${application.application_id}</a></td><td>${application.date}</td><td>${application.programs.department.name }</td><td>${application.programs.name}</td> <td>${application.term}</td>
			<c:choose>
			<c:when test="${application.status.get(fn:length(application.status)-1).status eq 'Not Submitted'}">
			<td style="color:green">${application.status.get(fn:length(application.status)-1).status}</td>  
			</c:when>
			<c:otherwise>
				<td style="color:red">${application.status.get(fn:length(application.status)-1).status}</td> 
			</c:otherwise>
			</c:choose>
			</tr>
			</c:forEach>
		</table>
		
	
	
	</div>
</div>




	
 

</body>
</html>