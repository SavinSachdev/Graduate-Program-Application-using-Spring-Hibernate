<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<title>Application Form</title>
</head>

<body>


	<div class="row" style="background-color: black">
		<div class="col-md-4 col-md-offset-4">
			<img src="banner.png"
				style='height: 100%; width: 100%; object-fit: contain' />
		</div>
		<div class="col-md-1 col-md-offset-1">
			<h3>
				<a href="students.html" style="color: white">Home</a>
			</h3>
		</div>
		<div class="col-md-1">
			<h3>
				<a href="logout.html" style="color: white">Logout</a>
			</h3>
		</div>
	</div>

	<hr  style="border: solid black 1px">


	<form:form modelAttribute="application" action="newApplication.html"
		method="post" >


	<div class="container" class="form-group">
			<div class="row">
				<div class="col-md-12">
					<h2>Enrollment Information</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<Label>Select Term</Label>
				</div>
				<div class="col-md-4" class="dropdown">
					<form:select path="term" selected="${application.term}"  class="form-control dropdown-toggle">
						<form:option value="">Select term</form:option>
						<form:option value="spring 2016">Spring 2016</form:option>
						<form:option value="fall 2016">Fall 2016</form:option>

					</form:select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<Label>Department</Label>
				</div>
				<div class="col-md-4">
					<c:choose>
						<c:when test="${empty edit}">
							<form:select  path="programs.department.name"
								id="departmentToSend" class="form-control dropdown-toggle">
								<form:option value="">Select Department</form:option>
								<c:forEach items="${allDepartments}" var="department">
									<form:option value="${department.name}">${department.name}</form:option><p id="departmentWarning" style="color:red;display:none">Enter Department</p>
								</c:forEach>
							</form:select>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="departmentToSend" value="1">
							<div class=col-md-4>
							
								${application.programs.department.name}</div>
						</c:otherwise>
					</c:choose>
				</div>

			</div>


			<div class="row">
				<div class="col-md-4">
					<label>Select Program</label>
				</div>
				<div class="col-md-4">
					<select name="programName" id="programsList" class="form-control dropdown-toggle">
						<option value=""></option>
						<c:if test="${not empty edit}">
							<c:forEach items="${departmentPrograms}" var="program">
								<c:choose>
									<c:when test="${program.name eq application.programs.name }">
										<option value="${program.name}" selected="selected">${program.name }</option>
									</c:when>
									<c:otherwise>
										<option value="${program.name}">${program.name }</option>
									</c:otherwise>
								</c:choose>



							</c:forEach>
						</c:if>


					</select>

				</div>
			</div>
			<div class="row" style="margin-top: 5%" >
				<div class="col-md-2 col-md-offset-5" id="nxt">
					<input type="button" class="btn btn-primary" onclick="enrollmentInfo()" value="next">
				</div>
			</div>
		</div>

 


		<div class="container" style="display: none" class="form-group">

			<div class="row">
				<div class="col-md-12">

					<h2>Enter Personal Details</h2>
				</div>
			</div>

				<div class="row">
					<div class="col-md-4">
						<label>Enter First name</label>
					</div>
					<div class="col-md-4">
						<form:input  path='studentDetails.fname' class="form-control"  />

					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<label>Enter Last name</label>
					</div>
					<div class="col-md-4">
						<form:input class="form-control" path="studentDetails.lname" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<label>Enter Email</label>
					</div>
					<div class="col-md-4">
						<form:input class="form-control" path="studentDetails.email" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<label>Enter Date of Birth</label>
					</div>
					<div class="col-md-4">
						<form:input class="form-control" id="date" path="studentDetails.dob" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<label>Gender</label>
					</div>
					<div class="col-md-4 radio">
						<label><form:radiobutton class="radio" path="studentDetails.gender" value="male" />Male</label>
						
						<label><form:radiobutton class="radio" path="studentDetails.gender" value="female" />Female</label>
					
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label>Enter Contact Number</label>
					</div>
					<div class="col-md-4">
						<form:input class="form-control" path="studentDetails.contact" />

					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label>Enter Citizenship</label>
					</div>
					<div class="col-md-4">
						<form:input class="form-control" path="studentDetails.citizenship" />
					</div>
				</div>
				<div class="row" style="margin-top: 2%"  >
					<div class="col-md-1 col-md-offset-4">
						<input type="button" class="btn btn-primary" onclick="prev()" value="previous">
					</div>
					<div class="col-md-1 ">
						<input type="button" class="btn btn-primary" onclick="show()" value="next">
					</div>
				</div>

			</div>

		







		<div class="container " style="display: none" class="form-group">
			<div class="row">
				<div>
					<h2>Educational Background</h2>
				</div>
			</div>
			
			<div  class="row" id="educationalBackground">
				<c:choose>
					<c:when test="${not empty application.degrees}">
						<c:forEach items="${application.degrees}" var="degree"
							varStatus="i">
						<div>
							<div class="row">
								<div class="col-md-4" id="university">
									<label>University Name:</label>
								</div>
								<div class="col-md-4">
									<form:input class="form-control" path="degrees['${i.index}'].universityName" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-4" id="degree">
									<label>Degree Earned:</label>
								</div>
								<div class="col-md-4">
									<form:input class="form-control" path="degrees['${i.index}'].degreeEarned" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-4" id="major">
									<label>Major</label>
								</div>
								<div class="col-md-4">
									<form:input class="form-control" path="degrees['${i.index}'].major" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-4" id="time">
									<label>Time Attended:</label>
								</div>
								<div class="col-md-4">
									<form:input id="timeAttended" class="form-control" path="degrees['${i.index}'].timeAttended" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-1 col-md-offset-4">
								<input type="button" class="btn btn-danger" name="${i.index}" onclick="deleteDb()" value="delete" >
								</div>
							</div>
						</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-md-4" id="university">
								<label>University Name:</label>
							</div>
							<div class="col-md-4">
								<form:input path="degrees[0].universityName" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4" id="degree">
								<label>Degree Earned:</label>
							</div>
							<div class="col-md-4">
								<form:input class="form-control" path="degrees[0].degreeEarned" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-4" id="major">
								<label>Major</label>
							</div>
							<div class="col-md-4">
								<form:input class="form-control" path="degrees[0].major" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-4" id="time">
								<label>Time Attended:</label>
							</div>
							<div class="col-md-4">
								<form:input id="timeAttended" class="form-control" path="degrees[0].timeAttended" />
							</div>
						</div>
						
					</c:otherwise>
				</c:choose>

			</div>
			<div class="row" style="margin-top: 1%" >
				<div class="col-md-2 col-md-offset-4">
					<input type="button" class="form-control" id="amp" value="Add Degrees">
				</div>

			</div>
			<div class="row" style="margin-top: 2%" >
					<div class="col-md-1 col-md-offset-4">
						<input type="button" class="btn btn-primary" onclick="prev()" value="previous">
					</div>
					<div class="col-md-1 ">
						<input type="button" class="btn btn-primary" onclick="checkDouble()" value="next">
					</div>
				</div>
		</div>







		<!-- Academic Record -->
		<div class="container" style="display: none" class="form-group">
			<div class="row">
			<h2>Academic Records</h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label>TOEFL Score</label>
				</div>
				<div class="col-md-4">
					<form:input id="toefl" class="form-control" path="academicRecords[0].toefl" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label>GRE Score</label>
				</div>
				<div class="col-md-4">
					<form:input id="gre" class="form-control" path="academicRecords[0].gre" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label>GPA</label>
				</div>
				<div class="col-md-4">
					<form:input id="gpa" class="form-control" path="academicRecords[0].gpa" />
				</div>
			</div>
			<div class="row" style="margin-top: 2%" >
					<div class="col-md-1 col-md-offset-4">
						<input type="button" class="btn btn-primary" onclick="prev()" value="previous">
					</div>
					<div class="col-md-1 ">
						<input type="button" class="btn btn-primary" onclick="checkToefl()" value="next">
					</div>
				</div>
		</div>





		<div class="container" style="display: none" class="form-group">
			<div class="row">
			<h2>Addtional Requirements for <Span id="dept"></Span> Department</h2>
			</div>
			<c:choose>
			<c:when test="${not empty application.additionalFields }">
				<c:forEach items="${application.additionalFields }"
					var="additionalField" varStatus="i">
					<div class="row">
						<div class="col-md-4">
							<label>${additionalField.name}</label>

						</div>
						<c:if test="${additionalField.required eq true}">
							<div class=col-md-1>
								<label style="color: red">*</label>
							</div>
						</c:if>
						<div class="col-md-4">
							<c:choose>
								<c:when test="${additionalField.type != 'File'}">

									<form:hidden path="additionalFields['${i.index}'].type" />
									<form:input path="additionalFields['${i.index}'].value" />
								</c:when>
								<c:otherwise>
									<div class="col-md-4">
									<Label>Uploaded File</Label>
									</div>
									<div class="col-md-4">
									${additionalField.value} 
									</div>
							</c:otherwise>
							</c:choose>
						</div>

					</div>

				</c:forEach>
			</c:when>
			<c:otherwise>
			<div id="af"></div>
			</c:otherwise>
			</c:choose>
			<div class="row" style="margin-top: 1%" >
					<div class="col-md-1 col-md-offset-4">
						<input type="button" class="btn btn-primary" onclick="prev()" value="previous">
					</div>
					<div class="col-md-1 ">
						<input type="button" class="btn btn-primary" onclick="show2()" value="next">
					</div>
				</div>
			
		</div>
			
	
		<div class="container" >

			<div class="row" >
				<div class="col-md-1 col-md-offset-4" id="submit" style="display: none">
					<input type="submit" class="btn btn-success" name="submit" value="submit">
				</div>
				<div class="col-md-1 col-md-offset-1" id="sv" style="display: none">
					<input type="submit" class="btn btn-success" name="submit" value="save">
				</div>
			</div>



		</div>
		<div class="container" id="finalPage" style="display:none">
			<div class="row">
				<div class="col-md-1">
					<input type="text" class="btn btn-success" value="previous" onclick="final()">
				
				</div>
			</div>
		</div>
	</form:form>
	
	<div class="container" id="upTrans" style="display:none;margin-top: 10%" >
		<div class="row">
			<div class="col-md-4">
				<Label>Upload Transcripts</Label>
			</div>

			<form id="uploadForm">
				<input type="file" class="form-control" id="transcript" name="transcript" /><input
					type="button" onclick="upload()" value="Upload">
			</form>

		</div>
	</div>


	
	<label class="col-md-offset-6" id="dw" style="display:none;color:red">Choose Department</label>
	<label class="col-md-offset-6" id="pw" style="display:none;color:red">Choose Program</label>
	<label class="col-md-offset-6" id="dow" style="display:none;color:red">Enter Number</label>
	<label class="col-md-offset-6" id="sw" style="display:none;color:red">Enter Number</label>


</body>
<script>

	function enrollmentInfo(){
		var val=($('#departmentToSend').val());
		if(val==null||val==""){
			($("#dw")).show();
		}else{
			($("#dw")).hide();
			val=($('#programsList').val())
			if(val==null||val==""){
				($("#pw")).show();
			}else{
				($("#pw")).hide();
				$("#sv").show()
				($(event.target).parent().parent().parent().hide().next().show());
			}
			
			
		}
			
	
	}

	$(document).ready(function() {
		$('#date').datepicker();

	});
	
	function deleteDb(){
		var apid=("${application.application_id}");
		var index=($(event.target).attr('name') );
		$(event.target).parent().parent().parent().hide();
		$.ajax('removeDegree.html',{
			data:{
				id:index,
				appid:apid
			},
			cache:false,
			success:function(response){
				$(event.target).parent().parent().parent().remove();
			
			}
		})
		$(event.target).parent().parent().parent().hide();
	}
	
	$(document)
			.ready(
					function() {
						$('#departmentToSend')
								.change(
										function() {
											//get the value of department and make a ajax request
											$('#dept').html(
													$('#departmentToSend')
															.val());
											$
													.ajax(
															'retrieveProgramsList.html',
															{

																data : {
																	'dname' : $(
																			this)
																			.val()
																},
																cache : false,
																success : function(
																		response) {
																	var response = response;
																	$(
																			'.toDelete')
																			.remove();
																	for (var i = 0; i < response.programs.length; i++) {
																		$(
																				'#programsList')
																				.append(
																						"<option value='"+response.programs[i].name+"' class='toDelete'>"
																								+ response.programs[i].name
																								+ "</option>");
																	}

																	for (var i = 0; i < response.AdditionalFields.length; i++) {
																		 
																		var output = "<div class='row' class='form-group'><div class='col-md-4'><label>";
																		output += response.AdditionalFields[i].name;
																		output += "</label></div>";
																		if (response.AdditionalFields[i].required == "true") {
																			output+="<input type='hidden' id='additionalFields"+i+".name' name='additionalFields["+i+"].name' value='"+response.AdditionalFields[i].name+"'>";
																			output += "<input type='hidden' id='additionalFields"+i+".required' name='additionalFields["+i+"].required' value='"+response.AdditionalFields[i].required+"'><div class='col-md-1'><span style='color:red'>*</span></div>"
																		}
																		if (response.AdditionalFields[i].type == "File") {
																			var id = "uploadForm"
																					+ (document.forms.length - 1);
																			output += '<input type="hidden" id="additionalFields'+i+'.type" name="additionalFields['+i+'].type" value="'+response.AdditionalFields[i].type+'"><div class="col-md-4 col-md-offset-1"><form  id="'+id+'" ><input type="file" class="form-control" id="transcript" name="transcript" /><input class="btn btn-primary" name="additional '
																					+ response.AdditionalFields[i].name
																					+ ' '
																					+ response.AdditionalFields[i].required
																					+ '  '
																					+ i
																					+ '" type="button" id="'
																					+ id
																					+ '" onclick="upload()" value="Upload"></form></div></div>';

																		} else
																			output += "<input type='hidden' id='additionalFields"+i+".type' name='additionalFields["+i+"].type' value='"+response.AdditionalFields[i].type+"'><div class='col-md-4'><input type='text' class='form-control' value='' id='additionalFields"+i+".value'   name='additionalFields["+i+"].value'></div></div>"
																		$('#af')
																				.append(
																						output);

																	}

																}

															})
										})

					})

	function upload() {

		var formid = ($(event.target).parent().attr('id'));
		var data = new FormData(document.forms.namedItem(formid));
		if ($(event.target).attr('name') != null) {
			var str = $(event.target).attr('name')
			var indx = str.split(" ");
			data.append("additionalFile", indx[2]);
			data.append("name", indx[1]);
			data.append("required", indx[2]);
		}

		$.ajax('upload.html', {
			type : 'POST',
			data : data,
			cache : false,
			contentType : false,
			processData : false,
			success : function(response) {
				console.log("Successfully Uploaded")

			}

		})
	}

	$(document)
			.ready(
					function() {
						$('#amp')
								.click(
										function() {
											var count = '${fn:length(application.degrees)}';
											var out = "<div><div class='row'><hr /><div class='col-md-4'>"
											out += $('#university').html();
											out += "</div><div class='col-md-4'>";
											out += "<input id='degrees"+count+".universityName' class='form-control' name='degrees["+count+"].universityName' type='text' value=''/></div></div>";
											out += "<div class='row'><div class='col-md-4'>"
											out += $('#degree').html();
											out += "</div><div class='col-md-4'>";
											out += "<input id='degrees"+count+".degreeEarned'class='form-control' name='degrees["+count+"].degreeEarned' type='text' value=''/></div></div>";

											out += "<div class='row'><div class='col-md-4'>"
											out += $('#major').html();
											out += "</div><div class='col-md-4'>";
											out += "<input id='degrees"+count+".major'class='form-control' name='degrees["+count+"].major' type='text' value=''/></div></div>";

											out += "<div class='row'><div class='col-md-4'>"
											out += $('#time').html();
											out += "</div><div class='col-md-4'>";
											out += "<input id='degrees"+count+".timeAttended' class='form-control' name='degrees["+count+"].timeAttended' type='text' value=''/></div></div>";
											out+='<div class="row" style="margin-top:1%"><div class="col-md-1 col-md-offset-4"><input type="button" class="btn btn-danger" value="delete" onclick="deleteDegree()"></div></div></div>'
											count++;

											$("#educationalBackground").append(
													out);

										})
					})
					
			function deleteDegree(){
		($(event.target).parent().parent().parent().remove());
	}	

	function show(){
	($(event.target).parent().parent().parent().hide().next().show());
	$('#departmentwarning').show();
	
	}
	
	function checkDouble(){
		
	if(isNaN(parseInt($("#timeAttended").val()))){
		$("#dow").show();
	}else{
		$("#dow").hide();
		show();
	}
	}
	
	function show2(){
		($(event.target).parent().parent().parent().hide().next().show());
		$('#upTrans').show();
		$('#submit').show();
		$('#finalPage').show();
	}
	
	function final(){
		$('#upTrans').hide();
		$('#submit').hide();
		($(event.target).parent().parent().parent().hide().prev().prev().show());
	}
	
	function prev(){
		($(event.target).parent().parent().parent().hide().prev().show());
	}
	function checkToefl(){
		var toefl=$('#toefl').val();
		var gre=$('#gre').val();
		var gpa=$('#gpa').val();
		if(isNaN(parseInt(toefl))||isNaN(parseInt(gre))||isNaN(parseInt(gpa))){
			$("#sw").show();
			
		}else{
			$("#sw").hide();
			show();
		}
	}
	
	
</script>
</html>