<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="jumbotron">
		<h2>Add Departments</h2>
	</div>

</div>

<div class="container">
<div class="row">
	<div class="col-md-4">
		<h2>Add Department Name</h2>
	</div>
	<div class="col-md-4">
		<h2>Add Progrrams</h2>
	</div>
	<div class="col-md-4">
		<h2>Add Additional Fields</h2>
	</div>
	</div>
</div>

<form:form modelAttribute="department">
<div class="container">
	
	<div class="row">
		<div class="col-md-4" id="txt">
			Department Name: <form:input path="name" class="form-control"  />
			
			<br /><input type="submit" class="btn btn-success" name="addDepartment" value="Add Department" />
		
		</div>
		<div class="col-md-4" >
			<div class="col-md-12" id="txts" >
			<form:input class="p form-control" path="programs[0].name"  />
			</div>
			<br />
			<br /><input  type="button" id="btn" value="Add More Programs" class="btn btn-success" >
		</div>
		<div class="col-md-4">
			<h2>Insert Additional Fields</h2>
			<div id="txts2">
			<div class="col-md-12">
				Name:
				<form:input path="additionalFields[0].name" class="form-control" />
			</div>
			<div class="col-md-12">
				Type
				<form:input path="additionalFields[0].type" class="form-control" />
			</div>
			<div class="col-md-12">
				Required
				<form:input path="additionalFields[0].required" class="form-control" />
			</div>
			</div>
			<div class="col-md-4 col-md-4">
					<br /><input  type="button" class="btn btn-success"  id="btn2" value="Add More Requirements" >
			</div>
		</div>
	</div>
	
		
</div>
<input type="submit" class="btn btn-success">
</form:form>



</body>
<script>
var count='${fn:length(department.programs)}';
$(document).ready(function(){
	$('#btn').click(function(){
		
		
		
		console.log("path")
		$('#txts').append('<br /><input id="programs'+count+'.name" name="programs['+count+'].name" class="p form-control" type="text" value=""/>');
		count++;
	})
})


var count2='${fn:length(department.additionalFields)}';
$(document).ready(function(){
	$('#btn2').click(function(){
		
		
		
		console.log("path")
		$('#txts2').append('<br/>Name:<input id="additionalFields'+count2+'.name" name="additionalFields['+count2+'].name" type="text" class="form-control" value=""/><br />Type:<input id="additionalFields'+count2+'.type" name="additionalFields['+count2+'].type" type="text" class=" form-control" value=""/><br />Required:<input id="additionalFields'+count2+'.required" name="additionalFields['+count2+'].required" class="form-control" type="text" value=""/><br /><br />');
		count++;
	})
})

</script>

</html>