<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
body
{
background-image:url("csula.jpg");
background-size:cover;
background-position:center;

}

</style>
<body></br></br></br>


<div class="container col-md-2 col-md-offset-8"  style="background-color:gray;opacity:0.9" >
	<div class="row">
		<div class="col-md-12 " style="text-align: center" style="background-color:black">
			<h2 style="color:white">Login</h2>
		</div>
	</div>
	<div class="row" >
		<div class="col-md-12  form-group" style="text-align: center">
			<form:form modelAttribute="user">
		<form:input path="email" class="form-control" placeholder="Enter your Email"/><form:errors path="email" />	
		</div>
	</div>
	<div class="row" >
		<div class="col-md-12  form-group" style="text-align: center">
			 <form:password path="password" class="form-control" placeholder="Enter Your Password"/><form:errors path="password" />	
		</div>
	</div>
	
	<div class="row">
	
	<div class="col-md-5 ">
		<center><button type="submit" name="login"  class="btn btn-success" value="login">Login</button></center></br>
	</div>
			<div class="col-md-5 ">	<center><a href="register.html" class="btn btn-danger">Registration</a></center></div>
		
		<c:if test="${not empty invalid}" >
		<div class="row">
		<div class="col-md-8 col-md-offset-1">
		<p style="color:red;font-weight: bold;">Invalid Username/password</p>
		</div></div>
		</c:if>
	
	</div>
	</form:form>
</div>
	




		
		
		
		
		
		

</body>
</html>