<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Regitration</title>
</head>
<style>
body
{
background-image:url("register.jpg");
background-size:cover;
background-position:center;

}

</style>
<body style="background-color:gray;opacity:0.8;">
<div class="container " style="margin-top:2%;">
	
		<div class="row " >
				<div class="panel panel-warning col-md-8 text-center  col-md-offset-3">
  				<div class="panel-heading" ><h2 style="color:black;font-family: fantasy;">Student Registration</h2></div>
 				 <div class="panel-body">
				<div class="row"  >
					<div class="col-md-4" >
							<img src="logo.png">
					</div>	
				<form:form modelAttribute="student" class="col-md-offset-3">

				<div class="col-md-8">
					<div class="input-group">
 							<br /> <span class="glyphicon glyphicon-user input-group-addon"></span>
 							<form:input path="fname" class="form-control col-md-5" style="text-align=center" placeholder="Enter First Name"/><form:errors path="fname" />
					</div>
					<br />
					<div class="input-group">
 					 <span class="input-group-addon glyphicon glyphicon-user" ></span>
 					 <form:input path="lname" class="form-control col-md-5"  placeholder="Enter Last Name" /><form:errors path="lname" />
					</div>
					<br />
					<div class="input-group">
  						<span class="input-group-addon glyphicon glyphicon-envelope" ></span>
  						<form:input path="email" class="form-control col-md-5" placeholder="Enter email" /><form:errors path="email" /><br/>
 						 <c:if test="${not empty emailUsed}">
						<p style="color:red">Email already Exist</p>
						</c:if>
					</div><br />
					<div class="input-group">
  							<span class="input-group-addon glyphicon glyphicon-wrench" ></span>
  							 <form:input path="password" class="form-control col-md-5" placeholder="Enter Password" /><form:errors path="password" />
					</div>
					<hr >
					<div class="row">
						<div class="col-md-4 col-md-offset-5">
						<button type="submit" name="register" value="register" class="btn btn-warning">Register</button>
						</form:form>
					</div>
			</div>
		</div>
		</div>
	</div>


	


</body>
</html>