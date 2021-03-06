<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Administrator</title>
</head>
<body>
<div class="container">
<div class="row">
<nav class="navbar navbar-inverse">
	<div class="col-md-5 col-md-offset-3">
 	<h3 style="color:white"><span class="glyphicon glyphicon-user"> ${currentUser.fname} !</span></h3>
 	</div>
 	<div class="col-md-3">
 	<h3 style="color:white"><a href="logout.html">Logout</a></h3>
 	</div>
</nav>
</div>
</div>
<div class="container" style="text-align:center">
	

	<div class="row">
		<div class="col-md-4">
		<center>	<h2>List Of Departments</h2></center>
		</div>
		<div class="col-md-4">
			<center><h2>No. Of Programs Offered</h2></center>
		</div>
		<div class="col-md-4">
			<center><h2>View/Manage</h2><center>
		</div>
		
	</div>	
</div>
<c:forEach items="${departments}" var="department" varStatus="index">
	<div class="container">
	
		
		<div class="row">
		<div class="col-md-4">
		<center><h3>${index.count}. ${department.name} </h3></center>
		</div>
		<div class="col-md-4">
					<center><span class="badge"><h4>${fn:length (department.programs)}</h4></span></center>
					
		</div>
		<div class="col-md-4">
				<center><h3><a href="departments/${department.dept_id}.html"><span class="glyphicon glyphicon-eye-open"> View</span></a>| <a href="edit/${department.dept_id}.html"><span class="glyphicon glyphicon-pencil"> Manage</span></a></h3></center>
		</div>
		
	</div>
	</div>
	</c:forEach>
	<div class="row">
		<div class="col-md-offset-4 col-md-4" >
		<center><h3><a href="addDepartment.html" class="btn btn-primary">Add Department</a></h3></center>
		</div>
	</div>



</body>
</html>