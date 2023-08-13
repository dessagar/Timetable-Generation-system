<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.BuildingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</script>
<meta charset="ISO-8859-1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css /">
 -->    <!-- Bootstrap CSS -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="https://use.fontawesome.com/6867b8e1d6.js"></script>
 --><!--     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 --><!--     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
 --><!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 -->    
<!--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 --><!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 --><!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
 -->
<title>Insert title here</title>
<link rel="stylesheet" href="../css/form.css">
<link rel="stylesheet" href="../css/table.css">
<link rel="stylesheet" href="../css/style.css">


<script>

 $(document).ready(function(){
	$("#exampleModal").modal('show');
});
</script>


</head>
<body>
	<%@ include file="../BuildingDetails.jsp" %>
	
	<%
	try{
		int buildingId=Integer.parseInt(request.getParameter("buildingId"));
		System.out.println(buildingId);
		BuildingDao bdao=new BuildingDao();
		ResultSet rs=bdao.getBuildingDetailsById(buildingId);
		if(rs.next())
		{
	%>
	
	
<div class="modal fade" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 27px" id="exampleModalLabel">Update Building Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="../EditBuildingController" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-7">
              <label for="validationCustom01" style="font-size: 27px" class="form-label">Building Name</label>
              <input type="text" class="form-control" name="building_name" id="validationCustom01" value="<%=rs.getString(2) %>" style="font-size: 25px ; width: 200px;" required >
              
              <input type="hidden" class="form-control" name="building_id"  id="validationCustom01" value="<%=rs.getString(1) %>" style="font-size: 40px" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-10">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No of floors:</label>
              <input type="text" class="form-control textfield" name="no_of_floors" size="50" id="validationCustom01" style="font-size: 17px" value="<%=rs.getInt(3) %>" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
           
           
           <!--  <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Add Building</button>
            </div> -->

      <div class="modal-footer">
        <a href="../BuildingDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close">Close</button></a>
        <button type="submit" class="btn btn-primary" style="font-size: 17px">Save changes</button>
      </div>
      </form>
      </div>
    </div>
  </div>
</div>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
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