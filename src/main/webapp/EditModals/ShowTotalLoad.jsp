<%@page import="com.dao.FacultyDao"%>
<%@page import="com.dao.LoadDistributionDao"%>
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
<%@ include file="../LoadDistributionDetails.jsp" %> 
<%
	try{
		
		int facultyId=Integer.parseInt(request.getParameter("facultyId"));
		FacultyDao fd=new FacultyDao();
		ResultSet rs=fd.getFacultyDetailsbyid(facultyId);
		
		if(rs.next())
		{
		%>	
		
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 27px" id="exampleModalLabel">Faculty Total Load</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
           <form action="#" method="post" class="row g-3 needs-validation" novalidate>
         
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Name</label>
              <input type="text" class="form-control"  name="faculty_name" id="validationCustom01" value="<%=rs.getString(2) %>" style="font-size: 17px ; width: 200px;" readonly="readonly" required >
              <input type="hidden" class="form-control" name="faculty_id" id="validationCustom01" value="<%=facultyId%>" style="font-size: 17px" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Abbreviation</label>
              <input type="text" class="form-control" name="faculty_abbr" id="validationCustom01" value="<%=rs.getString(3) %>" style="font-size: 17px ; width: 200px;" readonly="readonly" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Designation</label>
              <input type="text" class="form-control" name="faculty_abbr" id="validationCustom01" value="<%=rs.getString(5) %>" style="font-size: 17px ; width: 200px;" readonly="readonly" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Email</label>
              <input type="email" class="form-control" name="faculty_email" id="validationCustom01" value="<%=rs.getString(4) %>" style="font-size: 17px; width: 200px;" readonly="readonly" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            
            <%
            	
				 LoadDistributionDao lddao=new LoadDistributionDao();
            	 ResultSet rs1= lddao.getFacultyTotalLoad(facultyId);
            	 if(rs1.next())
            	 {
            		 System.out.println("Total load : "+rs1.getInt(2));
            %>
            		<div class="col-md-6">
                 <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Total Load</label>
                 <input type="text" class="form-control" name="faculty_abbr"  id="validationCustom01" value="<%=rs1.getInt(2)%>" style="font-size: 17px ; width: 200px;" readonly="readonly" required >
                 <div class="valid-feedback" style="font-size: 17px">
                   Looks good!
                 </div>
               </div>
             <%
            	 }
            	 
            %>
            	 
            	 
            	  <div class="modal-footer">
        <a href="../LoadDistributionDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close">Close</button></a>
      </div>
       
           
           <!--  <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Designation</label>
               <select class="form-select" style="font-size: 17px" id="validationCustom04" name="faculty_designation" required>
                <option selected disabled value="">Choose...</option>
                <option style="font-size: 17px">Principal</option>
                <option style="font-size: 17px">HOD</option>
                 <option style="font-size: 17px">Lecturer</option>
                
 -->              </select>
<!--               <input type="text" class="form-control" name="faculty_abbr" id="validationCustom01" value="" style="font-size: 17px" required >
 -->              <!-- <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div> -->
            <!-- </div>
             <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Faculty Type</label>
               <select class="form-select" style="font-size: 17px" id="validationCustom04" name="faculty_type" required>
                <option selected disabled value="">Choose...</option>
                <option style="font-size: 17px">Regular</option>
                <option style="font-size: 17px">Visiting</option>
              </select> -->
<!--             <!--   <input type="text" class="form-control" name="faculty_abbr" id="validationCustom01" value="" style="font-size: 17px" required >
 -->              <div class="valid-feedback" style="font-size: 17px">
               <!--  Looks good!
              </div> 
            </div> -->


      <div class="modal-footer">
        <a href="../LoadDistributionDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close">Close</button></a>
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
		
}
%>
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