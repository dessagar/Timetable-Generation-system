<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.FacultyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Details - GPP</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

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
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
 
<%@ include file="html/sidenav.html" %> 

<script type="text/javascript">
function ExportToExcel(type, fn, dl) {
    var elt = document.getElementById('tbl_exporttable_to_xls');
    var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
    return dl ?
      XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
      XLSX.writeFile(wb, fn || ('Faculty Details.' + (type || 'xlsx')));
 }
</script>

<% 
if(!session.isNew())
{
	String delete_msg=(String)session.getAttribute("success-msg");
	String update_msg=(String)session.getAttribute("update-msg");
	if(delete_msg=="true")
	{
		
		%>
		<script type="text/javascript">
		Swal.fire({
			//  position: 'top-end',
			icon : 'success',
			title : 'Faculty Deleted Successfully',
			showConfirmButton : false,
			timer : 1500,
		})
	</script>
		<% 
	}
	if(update_msg=="true")
	{
		%>
		<script type="text/javascript">
		Swal.fire({
			//  position: 'top-end',
			icon : 'success',
			title : 'Faculty updated Successfully',
			showConfirmButton : false,
			timer : 1500,
		})
	</script>
		<% 
	}
}
session.removeAttribute("success-msg");
session.removeAttribute("update-msg");

%>

<%
    	
    	if(!session.isNew())
    	{
    		session=request.getSession();
        	String  error=(String)session.getAttribute("duplicate_faculty");
        	if(error=="true")
        	{
     %>
    				<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Faculty is Already Registered with this Name..!',
       						showConfirmButton: false,
       						timer: 2200,
     					})
 
  					</script>
  <%
		}
	}
	/* session.invalidate(); */
	session.removeAttribute("duplicate_faculty");
  %>

    <!-- <div class="container" style="margin-top: 150px;margin-left: 200px;">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-md-6 col-xs-12">
                                <h4 class="title">Faculty Details </h4>
                            </div>
                            <div class="col-md-6 col-xs-12 text-right">
                                <div class="btn_group">
                                    <input type="text" id="search" class="form-control" placeholder="Search">
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
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Abbreviation</th>
                                    <th>Type</th>
                                    <th>Action</th>
                                    
                            </thead> -->
                        <div class="container" style="margin-top: 150px;margin-left: 200px;">
                                                            <div class="row">
                            
                            <%
                            try{
                            	
                            FacultyDao fdao=new FacultyDao();
                            ResultSet rs=fdao.getFacultyDetails();
                            int cnt=1;
                            if(!rs.next())
                            {
                            	%>
                            	
                            	<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
                          		<center><object data="icons/noresult.jpg" width="400" height="400" " ></object></center>
								<%
                            }
                            else
                            {
                                System.out.println("Inside while block");

                            %>
                            	
                                   
                                    <div class="col-md-offset-1 col-md-10">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col col-md-6 col-xs-12">
                                                        <h4 class="title">Faculty Details </h4>
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
                                                <table class="table" id="tbl_exporttable_to_xls">
                                                
                                                    <thead>
                                                        
                                                            <th>Sr.No</th>
                                                            <!-- <th>Id</th> -->
                                                            <th>Name</th>
                                                            <th>Abbreviation</th>
                                                            <th>Type</th>
                                                            <th>Action</th>
                                                            
                                                    </thead> 
                                                    
                                                    <ol id="list">
                            <tbody>
                                                    
                            	<%
                            	do{
                            		
                            	
                                 

                                 %>
                                     <tr>
                                         <td><%=cnt %></td>
                                         <%-- <td><%=rs.getInt(1) %></td> --%>
                                         <td><%=rs.getString(2) %></td>
                                         <td><%=rs.getString(3) %></td>
                                         <td><%=rs.getString(6) %></td>
                                         
                                         <td>
                                             <ul class="action-list">
                                                <a href="EditModals/EditFacultyModal.jsp?facultyId=<%=rs.getInt(1)%>"> <button type="button" class="btn btn-success " style="font-size: 15px"><i class="fa fa-edit">  </i> Edit</button>&nbsp</a> 

                                                 <!-- <li><a href="#" data-tip="edit"><i class="fa fa-edit"></i></a></li> -->
                                              <a href="DeleteFacultyController?facultyId=<%=rs.getInt(1) %>">   <button type="button" class="btn btn-danger "  style="font-size: 15px"><i class="fa fa-trash"> </i> Delete</button>&nbsp</a>
                                                 <button type="button" class="btn btn-warning "  style="font-size: 15px"><i class="fa fa-eye"> </i> Courses</button>

                                                 <!-- <li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li> -->
                                                 
                                             </ul>
                                         </td>
                                     </tr>
                                   <%
                                   		cnt++;
                                 	}while(rs.next());
                       
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
                        <div class="row">
               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
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
                    pdfMake.createPdf(docDefinition).download("Faculty Details.pdf");
                }
            });
        }
    </script>
    <script src="js/table.js"></script>
</body>
</html>