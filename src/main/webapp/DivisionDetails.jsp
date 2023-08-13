<%@page import="com.dao.DivisionDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.BuildingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Division Details - GPP</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css /">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script type = "text/javascript" >  
        window.history.forward();
        function noBack() { window.history.forward(); }
    </script> 
    <script src="https://use.fontawesome.com/6867b8e1d6.js"></script>
    <link rel="stylesheet" href="css/table.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <script>
function call()
{
$(document).ready(function(){
	$("#exampleModal").modal('show');
});
}
</script> 
</head>
  <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
 
 		<%@ include file="html/sidenav.html" %> 
 		
 		<script type="text/javascript">
 		function ExportToExcel(type, fn, dl) {
 	       var elt = document.getElementById('tbl_exporttable_to_xls');
 	       var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
 	       return dl ?
 	         XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
 	         XLSX.writeFile(wb, fn || ('Division Details.' + (type || 'xlsx')));
 	    }
 		</script> 


<%
	if(!session.isNew())
	{
		String delete_msg=(String)session.getAttribute("success-msg");
		String success_msg=(String)session.getAttribute("update-msg");
		
		if(delete_msg=="true")
		{
			%>
			<script type="text/javascript">
		Swal.fire({
			//  position: 'top-end',
			icon : 'success',
			title : 'Division Deleted Successfully',
			showConfirmButton : false,
			timer : 2000,
		})
	</script>
	<%
		}
		
		if(success_msg=="true")
		{
		%>	
			<script type="text/javascript">
			Swal.fire({
				//  position: 'top-end',
				icon : 'success',
				title : 'Division Updated Successfully',
				showConfirmButton : false,
				timer : 2000,
			})
		</script>
		<%
		}
	}
session.removeAttribute("success-msg");
session.removeAttribute("update-msg");
%>

 <%-- <%
    	
    	if(!session.isNew())
    	{
        	String  error=(String)session.getAttribute("Duplicate_division");
        	if(error=="true")
        	{
     %>
    				<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Division Name is already Registered..!',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  <%
		}
	}
	/* session.invalidate(); */
	session.removeAttribute("Duplicate_division");
  %> --%>
  

    <div class="container" style="margin-top: 150px;margin-left: 200px;">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-md-6 col-xs-12">
                                <h4 class="title">Division Details </h4>
                            </div>
                            <div class="col-md-6 col-xs-12 text-right">
                                <div class="btn_group">
                                    <input type="text" id="search" class="form-control" placeholder="Search">
                                    <!-- <button class="btn btn-search " title="Reload"><i class="fa fa-sync-alt"></i></button> -->
                                     <button class="btn btn-default" style="background-color: #ff7f7f" id="btnExport" onclick="Export()" title="Pdf"><i class="fa fa-file-pdf"></i></button>
                                    <button class="btn btn-default" title="Excel" onclick="ExportToExcel('xlsx')"><i class="fas fa-file-excel"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table" id="tbl_exporttable_to_xls" style="width: 2500px">
                            <thead>
                                
                                    <th>Sr.No</th>
                                    <th>Name</th>
                                    <th>Year</th>
                                    <th>Practical<br>Batches</th>
                                    <th>Tutorial<br>Batches</th>
                                    <th>Action</th>
                                    
                            </thead>
                            <ol id="list">
                            <tbody>
                            <%
                            ResultSet rs=null;
                            DivisionDao ddao=new DivisionDao();
                             rs=ddao.getDivisionDetails();
                            int cnt=1;
                            while(rs.next())
                            {
                            
                            %>
                                <tr>
                                    <td><%=cnt %></td>
                                    <%-- <td><%=rs.getInt(1) %></td> --%>
                                    <td><%=rs.getString(2) %></td>
                                    <td><%=rs.getInt(3) %></td>
                                    <td>&nbsp&nbsp&nbsp&nbsp<%=rs.getInt(4) %></td>
                                    <td>&nbsp&nbsp&nbsp&nbsp<%=rs.getInt(5) %></td> 
                                    <td>
                                        <ul class="action-list">
                                           <a href="EditModals/EditDivisionModel.jsp?divisionId=<%=rs.getInt(1)%>"> <button type="button"  class="btn btn-success " style="font-size: 15px"><i class="fa fa-edit">  </i> Edit</button>&nbsp &nbsp &nbsp</a>

                                            <!-- <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li> -->
                                          <a href="DeleteDivisionController?divisionId=<%=rs.getInt(1)%>"> <button type="button" class="btn btn-danger "  style="font-size: 15px"><i class="fa fa-trash"> </i> Delete</button></a>

                                            <!-- <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li> -->
                                        </ul>
                                    </td>
                                </tr>
                              <%
                              		cnt++;
                            	}
                              %>
                            </tbody>
                        </ol>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--     </div>
 -->    
    
    	
    <%-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" style="font-size: 27px" id="exampleModalLabel">Update Division Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        
      
<!--         <h2 class="title" style="font-size: 30px">Division Details</h2>
 -->        <form action="EditDivisionController" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-7">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Division Name</label>
                <%
/*         int divisionId=Integer.parseInt(request.getParameter("divisionId"));
 */    	ResultSet rs1=ddao.getDivisionDetails();
    if(rs1.next())
    {
    %>	
  
              <input type="text" class="form-control" name="division_name" id="validationCustom01" value="<%=rs1.getString(2) %>" style="font-size: 17px" required >
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
               <div class="invalid-feedback" style="font-size: 17px">
                 Please select Division Name
              </div>
            </div>
             <div class="col-md-7">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Year</label>
              <select class="form-select" style="font-size: 17px" name="year" id="validationCustom04" required>
                <option selected disabled value="<%=rs1.getInt(3)%>">Choose...</option>
                <option style="font-size: 17px">First Year</option>
                <option style="font-size: 17px">Second Year</option>
                <option style="font-size: 17px">Third Year</option>
              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select Year.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No of Practical Batches:</label>
             <select class="form-select" style="font-size: 17px" id="validationCustom04" name="pracbatches" required>
                <option selected disabled value="<%=rs1.getInt(4)%>">Choose...</option>
                <option style="font-size: 17px">1</option>
                <option style="font-size: 17px">2</option>
                <option style="font-size: 17px">3</option>
<!--                 <option style="font-size: 17px">Drawing Hall</option>
 -->              </select>
<!--               <input type="text" class="form-control textfield" name="no_of_pract" id="validationCustom01" style="font-size: 17px" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
 -->              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
               <div class="invalid-feedback" style="font-size: 17px">
                 Please select Number of Practical Batches.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No of Tutorial Batches:</label>
<!--               <input type="text" class="form-control textfield" name="no_of_tuts" id="validationCustom01" style="font-size: 17px" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
 -->               <select class="form-select" style="font-size: 17px" id="validationCustom04" name="tutbatches" required>
                <option selected disabled value=" <%=rs1.getInt(5)%>">Choose...</option>
                <option style="font-size: 17px">1</option>
                <option style="font-size: 17px">2</option>
                <option style="font-size: 17px">3</option>
<!--                 <option style="font-size: 17px">Drawing Hall</option>
 -->              </select>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
               <div class="invalid-feedback" style="font-size: 17px">
                 Please select Number of Tutorials Batches.
              </div>
            </div>
           
           
            <!-- <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Add Division</button>
            </div> -->
                       </form>
       
        </div>
        
        </div>
        </div>
        </div>
        

      <div class="modal-footer">
        <a href="DivisionDetails.jsp"> <button type="button" class="btn btn-secondary" style="font-size: 17px" data-dismiss="close">Close</button></a>
       <a href="DeleteDivisionController" ><button type="submit" class="btn btn-primary" style="font-size: 17px">Save changes</button></a>
      </div>
      
      </div>
    </div>
  </div>
</div>

<%
}
    
    %> --%>
    
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
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
                    pdfMake.createPdf(docDefinition).download("Division Details.pdf");
                }
            });
        }
    </script>
    <script src="js/table.js"></script>
</body>
</html>