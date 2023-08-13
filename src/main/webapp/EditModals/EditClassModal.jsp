<%@page import="com.dao.BuildingDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.ClassDao"%>
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

<%@ include file="../ClassDetails.jsp" %> 
 <script type="text/javascript">
 			var xmlHttp;
 			function showfloor(str)
 			{
 				console.log('hello'+str);
 				if(typeof XMLHttpRequest !=="undefined")
 				{
 					xmlHttp=new XMLHttpRequest();
 				}
 				else if (window.ActiveXObject)
 				{
					xmlHttp=new ActiveXOjbject("Microsoft.XMLHTTP");
				}
 				if(xmlHttp===null)
 				{
 					alert("Browser does not support XMLHTTP Request.");
 					return;	
 				}
 				var url="../ClassMasterDropdown?building="+str;
 				xmlHttp.onreadystatechange=stateChange;
 				xmlHttp.open("POST",url,true);
 				xmlHttp.send(null);
 			}
 			function stateChange()
 			{
 				if(xmlHttp.readyState===4 ||xmlHttp.readyState==='complete')
 				{
 					document.getElementById("floor").innerHTML=xmlHttp.responseText;
 				}
 			}
 		</script>
 		
 		<%
 			int classId=Integer.parseInt(request.getParameter("classId"));
 			ClassDao cd=new ClassDao();
 			ResultSet rs1=cd.getClassDetailsById(classId);
 			try{
 				
 				if(rs1.next())
 	 			{
 	 				
 	 			
 			
 		%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 27px" id="exampleModalLabel">Update class Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="../EditClassController" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-7">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Class Name</label>
              <input type="text" class="form-control" name="class_name" id="validationCustom01" value="<%=rs1.getString(2) %>" style="font-size: 17px;width: 200px;" required autocomplete="off" >
              <input type="hidden" class="form-control" name="class_id" id="validationCustom01" value="<%=classId%>" style="font-size: 17px;width: 200px;" required autocomplete="off" >
              <input type="hidden" class="form-control" name="building_id" id="validationCustom01" value="<%=rs1.getInt(4)%>" style="font-size: 17px;width: 200px;" required autocomplete="off" >
              
              
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            
            <div class="col-md-7">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Type of Class</label>
              <select class="form-select" style="font-size: 17px" id="validationCustom04" name="type" required>
                <option selected disabled value="">Choose...</option>
                <option style="font-size: 17px">Classroom</option>
                <option style="font-size: 17px">Lab</option>
                <option style="font-size: 17px">Tutorial Room</option>
                <option style="font-size: 17px">Drawing Hall</option>
              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select a Type of Class.
              </div>
            </div>

             <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Building Name</label>
              <select class="form-select" style="font-size: 17px" id="validationCustom04" onchange="showfloor(this.value)" name="buildingName" required>
                <option selected disabled value="">Choose...</option>
                <%
                	BuildingDao bdao=new BuildingDao();
            		ResultSet rs=bdao.getBuildingName();
                	while(rs.next())
                	{
                %>
                	<option style="font-size: 17px"><%=rs.getString(1)%></option>
                <% 
                	}
                	
                %>
               
                
<!--                 <option style="font-size: 17px">Computer2</option>
                <option style="font-size: 17px">Computer3</option>
                <option style="font-size: 17px">Computer4</option> -->
               
              </select>
              
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select a Building Name.
              </div>
            </div>
            
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Floor</label>
              <select  class="form-select" style="font-size: 17px" id="floor"  name="floorNo" required>
              
                <option selected disabled value="">Choose...</option>
                 <!--<option style="font-size: 17px">1st</option>
                <option style="font-size: 17px">2nd</option>
                <option style="font-size: 17px">3rd</option>
                <option style="font-size: 17px">4th</option> -->
              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select a Floor.
              </div>
            </div>
            
      <div class="modal-footer">
        <a href="../ClassDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close">Close</button></a>
        <button type="submit" class="btn btn-primary" style="font-size: 17px">Save changes</button>
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
 				e.getStackTrace();
 			}
 %>
<script type="text/javascript">

$('#exampleModal').on('hide.bs.modal', function (e) {
    e.preventDefault();
    e.stopPropagation();
    return false;
});</script>
</body>
</html>