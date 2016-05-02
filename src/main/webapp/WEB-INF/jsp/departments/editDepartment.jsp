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
<nav class="navbar navbar-inverse nav-fixed-top container">
	<div class="row">
		 <div class="navbar-header">
			<a class="navbar-brand" href=""><span class="glyphicon glyphicon-user"> ${currentUser.fname} </span></a>
		</div>
	<ul class="nav navbar-nav">
		<li><a href="../administrators.html">Home</a></li>
		<li><a href="../logout.html">Logout</a></li>
	</ul>
	</div>
</nav>
<form:form modelAttribute="department">
<div class="container-fluid">
<div class="row">
	
	<div class="col-md-4">
		<div class="panel panel-primary  text-center ">
  		<div class="panel-heading" ><h2 style="color:black;font-family: fantasy;">Edit Department</h2></div>
 		 <div class="panel-body" style="color:blue">
 		 	<div class="col-md-12 text-left" >
 		 	<strong >Change Department Name</strong>
 		 	</div>
 		 	<div class="col-md-8">
 		 	<form:input path="name" class="form-control"/>
 		 	</div>
 		 	<div class="col-md-4">
 		 	<a href="removeDepartment/${department.dept_id}.html" ><span class="glyphicon glyphicon-trash" style="font-size:20px"> Delete</span> </a>
 		 	</div>
 		 
 		 </div>
	</div>
	</div>
	
	<div class="col-md-4">
		<div class="panel panel-primary  text-center  ">
  		<div class="panel-heading" ><h2 style="color:black;font-family: fantasy;">Edit Programs</h2></div>
 		 <div class="panel-body">
 		 	<div  id="txts" class="row">
 		 		<c:forEach items="${department.programs}" var="program" begin="0" varStatus="i">
 		 		<div class="col-md-8"><form:input path='programs["${i.index}"].name' class="form-control" /><br></div>
 		 		<div class="col-md-4"><a href="removeProgram/${department.dept_id}/${i.index}.html" ><span class="glyphicon glyphicon-trash" style="font-size:20px"> Delete</span></a></div>
 		 		 </c:forEach>
 		 	</div>
 		 	
 		 	<hr />
 		 	<div>
 		 		<br /><input  type="button" id="btn" value="Add More Programs" class="btn btn-primary" >
 		 	</div>
 		</div>
		</div>
	</div>
	
	<div class="col-md-4">
		<div class="panel panel-primary text-center  ">
  		<div class="panel-heading" ><h2 style="color:black;font-family: fantasy;">Edit Additional Fields</h2></div>
 		<div class="panel-body">
 		
 			<div class="row" id="txts2" >
 			<c:forEach items="${department.additionalFields}" var="i" begin="0" varStatus="i">
 			<div  class="col-md-7 col-md-offset-1" style="border:dotted silver 1px;padding: 15px;border-radius:20px"> 
 				
 				
 					<div class="col-md-12" ><form:input path='additionalFields["${i.index}"].name' class="form-control" palaceholder="Name" /></div>
 					<div class="col-md-12"><form:input path='additionalFields["${i.index}"].type' class="form-control" palaceholder="Type" /></div>
 					<div class="col-md-12"><form:input path='additionalFields["${i.index}"].required' class="form-control" palaceholder="Required" /></div>
 			</div>
 					<div class="col-md-4"><a href="removeAdditionalFields/${department.dept_id}/${i.index}.html"><span class="glyphicon glyphicon-trash" style="font-size:35px"> Delete</span></a><br></div>
 				</c:forEach>
 				</div>
 			<hr>
 			<div><input type="button" id="btn2" value="Add Additional Fields" class="btn btn-primary"><br></div>
		</div>
		</div>
	</div>
</div>
</div>
<div class="container"><div class="row"><center><input type="submit" class="btn btn-primary" Value="Save Changes"/></center>
</div></div>

</form:form>



</body>
<script>
var count='${fn:length(department.programs)}';
$(document).ready(function(){
	$('#btn').click(function(){
		console.log(count);
		$('#txts').append('<br /><div class="col-md-8"><input id="programs'+count+'.name" name="programs['+count+'].name" class="p form-control" type="text"  value=""/></div><div class="col-md-4"><a href="removeProgram/${department.dept_id}/'+count+'.html"  ><span class="glyphicon glyphicon-trash" style="font-size:20px"> Delete</span></a></div><br />');
		count++;
	})
})


var count2='${fn:length(department.additionalFields)}';

$(document).ready(function(){
	$('#btn2').click(function(){
		
		$('#txts2').append('<br /><div class="row"><div class="col-md-7 col-md-offset-1" style="border:dotted silver 1px;padding: 15px;border-radius:20px"><div class="col-md-12"><input id="additionalFields'+count2+'.name" name="additionalFields['+count2+'].name" type="text" class="form-control" placeholder="name"></div><div class="col-md-12"><input id="additionalFields'+count2+'.type" name="additionalFields['+count2+'].type" type="text" class="form-control" placeholder="type"/></div><div class="col-md-12"><input id="additionalFields'+count2+'.required" name="additionalFields['+count2+'].required" type="text" class="form-control" placeholder="is required"/></div></div><div class="col-md-4"><a href="removeAdditionalFields/${department.dept_id}/${i.index}.html"><span class="glyphicon glyphicon-trash" style="font-size:35px"> Delete</span></a></div></div>');
		count2++;
	})
})

</script>



</html>