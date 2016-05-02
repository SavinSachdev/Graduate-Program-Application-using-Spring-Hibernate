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
<body style="font: bold;font-family: sans-serif;">

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

<div class="container col-md-6 col-md-offset-3 center" style="background-color: #8E8E8E">
	<div class="row">
		<div class="col-md-4">
		<h3><strong>Application Id:</strong></h3>
		</div>
		<div class="col-md-4">
		<h3><strong>${viewApplication.application_id}</strong></h3>
		</div>
	</div>
	<div class="row">
		<center><h2>Student Information</h2></center>
		
		<div class="col-md-4">
		<label>First Name:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.fname}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Last Name:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.lname}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>CIN:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.student.cin}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Phone:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.contact}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Email:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.email}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Gender:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.gender}</label>
		</div>
	</div>
	
	
	
	
	<div class="row">
		<div class="col-md-4">
		<label>Date of Birth:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.dob}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Citizenship :</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.studentDetails.citizenship}</label>
		</div>
	</div>
	<hr />
	<div class="row">
		<center><h2>Applied For</h2></center>
		<div class="col-md-4">
		<label>Department:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.programs.department.name}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Program:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.programs.name}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		<label>Term:</label>
		</div>
		<div class="col-md-4">
		<label>${viewApplication.term}</label>
		</div>
	</div>
	<hr />
	<div class="row">
		<center><h2>Educational Details Provided</h2></center>
	</div>
	<c:forEach items="${viewApplication.degrees}" var="degree">
	<div class="row">
		<div class="col-md-4">
		
		<label>Degree Earned:</label>
		</div>
		<div class="col-md-4">
		<label>${degree.degreeEarned}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		
		<label>From University:</label>
		</div>
		<div class="col-md-4">
		<label>${degree.universityName}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		
		<label>For Major:</label>
		</div>
		<div class="col-md-4">
		<label>${degree.major}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		
		<label>Time Attended:</label>
		</div>
		<div class="col-md-4">
		<label>${degree.timeAttended}</label>
		</div>
	</div>
	</c:forEach>
	<hr />
	<div class="row">
	<center><h2>Academic Records</h2></center>
	</div>
	<div class="row">
	<div class="col-md-4">
	 	<label>Uploaded Transcripts</label>
	 </div>
	<div class="col-md-4">
			<a href='download.html?applicationId=${viewApplication.application_id}'>${viewApplication.academicRecords[0].transcripts}</a>
		</div></div>
	<c:forEach items="${viewApplication.academicRecords}" var="acdRecord">
	<div class="row">
		<div class="col-md-4">
		
		<label>GRE:</label>
		</div>
		<div class="col-md-4">
		<label>${acdRecord.gre}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		
		<label>TOEFL:</label>
		</div>
		<div class="col-md-4">
		<label>${acdRecord.toefl}</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
		
		<label>GPA:</label>
		</div>
		<div class="col-md-4">
		<label>${acdRecord.gpa}</label>
		</div>
	</div>
	
	 

	</c:forEach>
	
</div>
<hr / style="border:10px solid white;width:5px">
</body>
</html>