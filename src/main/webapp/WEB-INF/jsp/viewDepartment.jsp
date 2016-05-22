<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="jumbotron">
<center><h2>${department.name}</h2></center>
</div>
</div>



	<div class="container" >
		
		<div class="row">
			<div class="col-md-5">
				<h2>Programs Offered</h2>
			</div>
			<div class="col-md-5">
				<h2>Additional Fields</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5">
				<c:forEach items="${department.programs}" var="program">
					<h3>${program.name}</h3>
				</c:forEach>
			</div>
			<div class="col-md-5">
				<c:forEach items="${department.additionalFields}" var="additional">
					<h3>${additional.name}</h3>
					<h3>${additional.type}</h3>
					<h3>${additional.required}</h3>
				</c:forEach>
			</div>
		</div>
		


	</div> 
</body>
</html>