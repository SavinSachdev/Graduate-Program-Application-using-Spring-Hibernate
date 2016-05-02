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
<form:form modelAttribute="newdepartment">
<div class="container">
	<div class="jumbotron">
		<h2>Add Departments</h2>
	</div>

</div>
<div class="container">

<div class="row">
<div>
<h2>Add Department Name</h2>
</div>
<div  id="txt">
			<label>Department Name: </label><form:input path="name" class="form-control"  />
			
			<br /><input type="submit" class="btn btn-success" name="addDepartment" value="Add Department" />
		
</div>
<div >
		<h2>Add Programs</h2>
</div>
<div  >
			<div  id="txts" >
			<form:input class="p form-control" path="programs[0].name"  />
			</div>
			<br />
			<br /><input  type="button" id="btn" value="Add More Programs" class="btn btn-success" >
</div>
<div>

</div>
	<h2>Add Additional Fields</h2>
</div>
<div id="txts2">
		<div >
				<label>Name:</label>
				<form:input path="additionalFields[0].name" class="form-control" />
		</div>
			<div >
				<label>Type:</label>
				<form:select path="additionalFields[0].type" class="dropdown form-control">
				<form:option  value="" class="dropdown-header">Select Required Type</form:option>
				<form:option  value="text">Text</form:option>
				<form:option  value="number">Number</form:option>
				<form:option  value="file">File</form:option>
				</form:select>
				
			</div>
			<div >
				<label>Required:</label>
				<form:radiobutton path="additionalFields[0].required" value="true"/> Required
				<form:radiobutton path="additionalFields[0].required" value="false" /> Not Required
			</div>
</div>
			<div>
			<div >
					<center><br /><input  type="button" class="btn btn-success"  id="btn2" value="Add More Requirements" ></center>
			
			</div>
</div>







			
		
		</div>
	
	
	<br />	

<div>
<center><input type="submit" class="btn btn-success"></center>
</form:form>	
</div>



</body>
<script>
var count='${fn:length(newdepartment.programs)}';
$(document).ready(function(){
	$('#btn').click(function(){
		$('#txts').append('<br /><input id="programs'+count+'.name" name="programs['+count+'].name" class="p form-control" type="text" value=""/>');
		count++;
	})
})


var count2='${fn:length(newdepartment.additionalFields)}';
$(document).ready(function(){
	$('#btn2').click(function(){
		
		
		
		console.log("path")
		$('#txts2').append('<div ><label>Name:</label><input id="additionalFields'+count2+'.name" name="additionalFields['+count2+'].name" type="text" class="form-control" /></div><div ><label>Type:</label><select id="additionalFields'+count2+'.type" name="additionalFields['+count2+'].type"  class=" form-control"  class="dropdown form-control"><option  class="dropdown-header">Select Required Type</option><option  value="text">Text</option><option  value="number">Number</option><option  value="file">File</option></select></div><div ><label>Required:</label><input type="radio" id="additionalFields'+count2+'.required" name="additionalFields['+count2+'].required"  value="true"/> Required<input type="radio" id="additionalFields'+count2+'.required" name="additionalFields['+count2+'].required"  value="false" /> Not Required</div>');
		count++;
	})
})

</script>

</html>