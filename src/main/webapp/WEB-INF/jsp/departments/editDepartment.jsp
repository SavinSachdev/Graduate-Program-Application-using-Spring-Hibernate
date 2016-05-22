<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<title>Edit</title>
</head>
<body>
	<div class="container">

	  <div class="jumbotron">
<center><h2>EDIT DEPARTMENT</h2></center></div>
	<form:form modelAttribute="department">
	<b><label>Change Department Name:</label></b><form:input path="name" class="form-control"/><br> <a href="removeDepartment/${department.dept_id}.html" class="btn btn-primary">Delete</a><br /><hr />
	<b><label>Manipulate Programs:</label></b>
		<div class="row">
			<div class="col-md-5" id="txts">
				<c:forEach items="${department.programs}" var="program" begin="0" varStatus="i">
					<br><form:input path='programs["${i.index}"].name' class="form-control" /><br>
						<a href="removeProgram/${department.dept_id}/${i.index}.html" class="btn btn-primary">Delete</a><br>
					</c:forEach>
			</div>
		</div>
		
		<div class="row">
		<div class="col-md-4">
		<br><input  type="button" id="btn" value="Add More Programs" class="btn btn-primary" >
		<hr />
		</div>
		</div>
	
		
		<div>
		<h3>Change Additional Fields</h3>
		<div class="row"><div class="col-md-5" id="txts2">
		
		<c:forEach items="${department.additionalFields}" var="i" begin="0" varStatus="i">
			<form:input path='additionalFields["${i.index}"].name' class="form-control" />
			<form:input path='additionalFields["${i.index}"].type' class="form-control" />
			<form:input path='additionalFields["${i.index}"].required' class="form-control" />
			<a href="removeAdditionalFields/${department.dept_id}/${i.index}.html"><input type="button" value="Delete" /></a>
		</c:forEach>
		
		</div></div>
		<input type="button" id="btn2" value="Add Additional Fields" class="btn btn-primary"><br>
		
		</div>
		<br><input type="submit" class="btn btn-primary">
	</form:form>
			</div>
	
</body>
<script>
var count='${fn:length(department.programs)}';
$(document).ready(function(){
	$('#btn').click(function(){
		$('#txts').append('<br /><input id="programs'+count+'.name" name="programs['+count+'].name" class="p form-control" type="text"  value=""/><a href="removeProgram/+${department.dept_id}+/'+count+'.html" class="btn btn-primary" >Delete</a>');
		count++;
	})
})


var count2='${fn:length(department.additionalFields)}';
$(document).ready(function(){
	$('#btn2').click(function(){
		$('#txts2').append('<br/>Name:<input id="additionalFields'+count2+'.name" name="additionalFields['+count2+'].name" type="text" class="form-control" value=""/><br />Type:<input id="additionalFields'+count2+'.type" name="additionalFields['+count2+'].type" type="text" class="form-control" value=""/><br />Required:<input id="additionalFields'+count2+'.required" name="additionalFields['+count2+'].required" type="text" class="form-control" value=""/><br /><br />');
		count++;
	})
})

</script>



</html>