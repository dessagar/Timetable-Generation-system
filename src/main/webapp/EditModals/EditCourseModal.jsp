<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.DivisionDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css /">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://use.fontawesome.com/6867b8e1d6.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 

<title>Insert title here</title>
<link rel="stylesheet" href="../css/form.css">
<link rel="stylesheet" href="../css/table.css">
<link rel="stylesheet" href="../css/style.css">


<script>

$(document).ready(function(){
	$("#exampleModal").modal('show');
});


</script>

<title></title>
</head>
<body>
<%@ include file="../CourseDetails.jsp" %> 
<%
	try{
		
	
	String courseId=request.getParameter("courseId");
	CourseDao cd=new CourseDao();
	ResultSet rs=cd.getCourseDetailsById(courseId);
	if(rs.next())
	{
		
%> 
		
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 27px" id="exampleModalLabel">Update Course Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body"> -->
        
      
<!--         <h2 class="title" style="font-size: 30px">Division Details</h2>
 -->       <h2 class="title" style="font-size: 30px">Course Details</h2>
        <form action="../EditCourseController" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Course Code</label>
              <input type="text" class="form-control" name="course_code" id="validationCustom01" value="<%=rs.getString(1) %>" style="font-size: 17px;width: 200px;" required >
              <input type="hidden" class="form-control" name="courseId" id="validationCustom01" value="<%=rs.getString(1)%>" style="font-size: 17px" required >
              
              
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Course Name</label>
              <input type="text" class="form-control" name="course_name" id="validationCustom01" value="<%=rs.getString(2) %>" style="font-size: 17px;width: 200px;" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Course Abbreviation</label>
              <input type="text" class="form-control" name="course_abbr" id="validationCustom01" value="<%=rs.getString(3) %>" style="font-size: 17px;width: 200px;" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
			<div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Year</label>
              <select class="form-select" style="font-size: 17px" id="validationCustom04" name="year" required>
                <option selected disabled value="">Choose...</option>
                <option style="font-size: 17px">First Year</option>
                <option style="font-size: 17px">Second Year</option>
                <option style="font-size: 17px">Third Year</option>
	              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select a Division name.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No.of Theory</label>
              <input type="text" class="form-control textfield" name="no_of_theory" id="validationCustom01" style="font-size: 17px;width: 200px;" value="<%=rs.getInt(5) %>" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No.of Practicals</label>
              <input type="text" class="form-control textfield" name="no_of_pract" id="validationCustom01" style="font-size: 17px;width: 200px;" value="<%=rs.getInt(6) %>" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No.of Tutorials</label>
              <input type="text" class="form-control textfield" name="no_of_tuts" id="validationCustom01" style="font-size: 17px;width: 200px;" value="<%=rs.getInt(7) %> " id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
           
           
           
            <!-- <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Add Division</button>
            </div> -->
                       <div class="modal-footer">
        <a href="../CourseDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close" data-backdrop="static" data-keyboard="false">Close</button></a>
       <button type="submit" class="btn btn-primary" style="font-size: 17px" data-backdrop="static" data-keyboard="false">Save changes</button>
      </div>
    </form>
      
       
        </div>
        
        </div>
        </div>
        </div>
        
<%

	}
      }catch(Exception e)
{
    	e.printStackTrace();  
}
%>   
     <!--  </div>
    </div>
  </div>
</div> -->
<script type="text/javascript">

$('#exampleModal').on('hide.bs.modal', function (e) {
    e.preventDefault();
    e.stopPropagation();
    return false;
});</script>
<script src="../js/form.js"></script>
<script src="../js/sidenav.js"></script>
</body>
</html>