<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.BuildingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Building Details - GPP</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css /">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script src="https://use.fontawesome.com/6867b8e1d6.js"></script>
<link rel="stylesheet" href="css/table.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>


<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">

	<%@ include file="html/sidenav.html"%>
	<script type="text/javascript">
	function ExportToExcel(type, fn, dl) {
		console.log("Hello in excel")
	       var elt = document.getElementById('tbl_exporttable_to_xls');
	       var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
	       return dl ?
	         XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
	         XLSX.writeFile(wb, fn || ('Building Details.' + (type || 'xlsx')));
	    }
	</script>
	<% 

if(!session.isNew())
{

	String update_msg=(String)session.getAttribute("update-success");
	String delate_msg=(String)session.getAttribute("delete-success");

	if(update_msg=="true")
	{
		delate_msg="false";

		%>
				<script type="text/javascript">
		Swal.fire({
			//  position: 'top-end',
			icon : 'success',
			title : 'Data Updated Successfully',
			showConfirmButton : false,
			timer : 1500,
		})
	</script>
	<%
	}
if(delate_msg=="true")	
	{
		%>
		
		<script type="text/javascript">
		Swal.fire({
			//  position: 'top-end',
			icon : 'success',
			title : 'Data Deleted Successfully',
			showConfirmButton : false,
			timer : 1500,
		})
	</script>	
	<%
	}
}
/* session.invalidate(); */
session.removeAttribute("update-success");
session.removeAttribute("delete-success");

%>

<%
    	
    	if(!session.isNew())
    	{
    		session=request.getSession();
        	String  error=(String)session.getAttribute("Duplicate_Building");
        	if(error=="true")
        	{
     %>
    				<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Building Name Already Registered, Try again with Another Name.',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  <%
		}
	}
/* 	session.invalidate();
 */	session.removeAttribute("Duplicate_Building");
  %>

	<div class="container" style="margin-top: 150px; margin-left: 200px;">
		<!-- <div class="row">
			<div class="col-md-offset-1 col-md-10">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-md-6 col-xs-12">
								<h4 class="title">Building Details</h4>
							</div>
							<div class="col-md-6 col-xs-12 text-right">
								<div class="btn_group">
									<input type="text" id="search" class="form-control"
										placeholder="Search">
									<button class="btn btn-search " title="Reload"><i class="fa fa-sync-alt"></i></button>
									<button class="btn btn-default" title="Pdf"><i class="fa fa-file-pdf"></i></button>
                                    <button class="btn btn-default" title="Excel"><i class="fas fa-file-excel"></i></button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body table-responsive">
						<table class="table">
							<thead>

								<th>Sr.No</th>
								 <th>Building Id</th>
								<th>Building Name</th>
								<th>No. of Floors</th>
								<th>Action</th>

							</thead>
							<ol id="list">
								<tbody> -->

							<% 
                            try{
                            BuildingDao bdao=new BuildingDao();
                            ResultSet rs=bdao.getBuildingDetails();
                            int cnt=1;
                            if(!rs.next())
                            {
                            	%>
                            	<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
                          		<center><object data="icons/noresult.jpg" width="400" height="400" " ></object></center>
								<%
								System.out.println("Inside if block");
                            	
                            }
                            else
                            {
                            	
                                %>
                                 <div class="row">
			<div class="col-md-offset-1 col-md-10">
				<div class="panel">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-md-6 col-xs-12">
								<h4 class="title">Building Details</h4>
							</div>
							<div class="col-md-6 col-xs-12 text-right">
								<div class="btn_group">
									<input type="text" id="search" class="form-control"
										placeholder="Search">
<!-- 									<button class="btn btn-search " title="Reload"><i class="fa fa-sync-alt"></i></button>
 -->									<button class="btn btn-default" style="background-color: #ff7f7f" id="btnExport" onclick="Export()" title="Pdf"><i class="fa fa-file-pdf"></i></button>
                                    <button class="btn btn-default" style="background-color: green" title="Excel" onclick="ExportToExcel('xlsx')"><i class="fas fa-file-excel fa-lg"></i></button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body table-responsive">
						<table class="table" id="tbl_exporttable_to_xls">
							<thead>

								<th>Sr.No</th>
								
								<th>Building Name</th>
								<th>No. of Floors</th>
								<th>Action</th>

							</thead>
							<%do{ %>
							<ol id="list">
								<tbody>
    									<tr>
    										<td><%=cnt%></td>
    										<%-- <td><%=rs.getInt(1) %></td> --%>
    										<td><%=rs.getString(2)%></td>
    										<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=rs.getInt(3) %></td>
    										<td>
    											<ul class="action-list">
    												
    													<a href="EditModals/EditBuildingModal.jsp?buildingId=<%=rs.getInt(1) %> ">
    													<button type="button" data-target="#exampleModal" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-success "
    														style="font-size: 15px">
    														<i class="fa fa-edit"> </i> Edit
    													</button>
    												</a>&nbsp &nbsp &nbsp

    												<a href="DeleteBuilding?buildingId=<%=rs.getInt(1) %>"> <button type="button"  class="btn btn-danger "
    													style="font-size: 15px">
    													<i class="fa fa-trash"> </i> Delete
    												</button></a>
    												
    												<!-- <button type="button" onclick="alert()"
    													class="btn btn-danger " style="font-size: 15px">
    													<i class="fa fa-trash"> </i> Delete
    												</button> -->

    												<!-- <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li> -->
    											</ul>
    										</td>
    									</tr>
    									<%
                                  		cnt++;
                                		}
                            while(rs.next());
                            }
                        
                            }catch(Exception e){
                            	e.printStackTrace();
                            }
                              %>
								</tbody>
							</ol>
						</table>
						
						
					</div>
					<div class="panel-footer">
						<div class="row"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

	<!-- Modal -->
	<!-- <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-20" style="height: 270px">
        <h2 class="title" style="font-size: 30px">Building Details</h2>
        <form action="EditBuildingController" method="post" class="row g-3 needs-validation" novalidate>
        
            <div class="col-md-12">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Building Name</label>
              <input type="text" class="form-control" name="building_name" id="validationCustom01" value="" style="font-size: 17px" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>
            <div class="col-md-10">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No of floors:</label>
              <input type= class="
													form-control textfield" name="no_of_floors"
													id="validationCustom01" style="font-size: 17px" value=""
													id="onlyNumbers" name="onlyNumbers"
													onkeypress="return isNumber(event)" onpaste="return false;"
													required>
													<div class="valid-feedback" style="font-size: 17px">
														Looks good!</div>
													</div>

													</div>
													<div align="center">
														<button class="btn btn-success" type="submit"
															style="font-size: 15px"; text-align:"center";>
															<i class="fas fa-plus"></i> Add Building
														</button>
													</div>
													</div>
													</div>
													</div> -->

	<!-- 		<script src="js/Deletesweetalert.js"></script>
 -->
	<script type="text/javascript">
 function alert()
 {
 Swal.fire({
  position: 'top',
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
  
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!'
}).then((result) => {
  if (result.isConfirmed) {
	  
	 
    Swal.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  }
})
 }
</script>
 <script type="text/javascript">
        function Export() {
        	
        	console.log("inside export fnunction")
            html2canvas(document.getElementById('tbl_exporttable_to_xls'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Building Details.pdf");
                }
            });
        }
    </script>
    
	<script src="js/table.js"></script>


</body>
</html>