<%@page import="com.dao.DivisionCourseAllocationDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
      <link rel="stylesheet" href="css/form.css">
          <link rel="stylesheet" href="css/table.css">
      
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet"> 
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
   
  <script src="https://kit.fontawesome.com/a4f00a5269.js" crossorigin="anonymous"></script>
   
   
   <!-- multiselect dropdown links -->   
   <script>
   $('select').selectpicker();
    </script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>DivisionCoursesDetails|GPP</title>
</head>
<body >
<%@ include file="html/sidenav.html" %>

<script type="text/javascript">
function ExportToExcel(type, fn, dl) {
    var elt = document.getElementById('tbl_exporttable_to_xls');
    var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
    return dl ?
      XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
      XLSX.writeFile(wb, fn || ('Division Course Allocation.' + (type || 'xlsx')));
 }
</script>

<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h5 class="title" style="font-size: 30px">Division Course Allocation Details</h5>
        <form class="row g-3 needs-validation" action="DivisionCourseAllocationDetailsController" method="post" novalidate>
           
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Term</label>
              <select class="form-select" id="validationCustom04" style="font-size: 17px" name="term" required>
                <option selected disabled value="">Choose..</option>
                <option style="font-size: 17px">EVEN</option>
                <option style="font-size: 17px">ODD</option>
                

              </select>
              <div class="invalid-feedback">
                Please select a Term
              </div>
            </div>

            <div class="col-md-6">
                <label for="validationCustom04" class="form-label" style="font-size: 17px">Year</label>
                <!-- <input class="date-own form-control" style="width: 300px;" type="text"> -->
               
                <input type="text" class="form-control" autocomplete="off" name="year" id="datepicker" id="validationCustom04" />

                <script>
                $(document).ready(function(){
                  $("#datepicker").datepicker({
                     format: "yyyy",
                     viewMode: "years", 
                     minViewMode: "years",
                     autoclose:true
                  });   
                })
                
                
                </script>
             </div>
      <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Get Details</button>
            </div>
          </form>
       
       
        </div>
        </div>
        </div>
        </div>
        <%
        if(!session.isNew())
    	{
    	
	ResultSet rs=null;
     rs=(ResultSet)session.getAttribute("Result");
    		session=request.getSession();
    		
        	String res=(String)session.getAttribute("Res");
        	String fail=(String)session.getAttribute("status-fail");
        	
        	System.out.println(fail);
        	
        	if(fail=="true")
        	{
        		
        		%>
        		
        		<center><label style="color:black;font-size: 30px;">No Result Found...!!</label></center>
  				<center><object data="icons/noresult.jpg" width="400" height="400" " ></object></center>
					
					<%
        	}
        		if(res=="true")
            	{

            		%>
            		 <div class="container" style=margin-top:-250px margin-left: 200px;">
            	        <div class="row">
            	            <div class="col-md-offset-1 col-md-10">
            	                <div class="panel">
            	                    <div class="panel-heading">
            	                        <div class="row">
            	                            <div class="col col-md-6 col-xs-12">
            	                                <h4 class="title">Division Course Allocation Details </h4>
            	                            </div>
            	                            <div class="col-md-6 col-xs-12 text-right">
            	                                <div class="btn_group">
            	                                    <input type="text" id="search" class="form-control" placeholder="Search">
<!--             	                                    <button class="btn btn-search " title="Reload"><i class="fa fa-sync-alt"></i></button>
 -->            	                                      <button class="btn btn-default" style="background-color: brown" title="Pdf"><i class="fa fa-file-pdf"></i></button>
            	                                    <button class="btn btn-default" title="Excel" onclick="ExportToExcel('xlsx')"><i class="fas fa-file-excel"></i></button>
            	                                </div>
            	                            </div>
            	                        </div>
            	                    </div>
            	                    <div class="panel-body table-responsive">
            	                        <table class="table " id="tbl_exporttable_to_xls">
            	                            <thead>
            	                                
            	                                    <th>Sr.No</th>
            	                                    <th>Division</th>
            	                                    <th>Allocated Course Code</th>
            	                                    <th>Allocated Course Name</th>
            	                                   
            	                                    
            	                            </thead>
            	                            <ol id="list">
                                    <tbody>
            	                            <%
            	                            try
            	                    		{
            	                            	DivisionCourseAllocationDao dcad=new DivisionCourseAllocationDao();
            	                     
                    	                        int cnt=1;
                    	                        int flag=0;
                                                int srNo=1;
                                               	ArrayList<String> divisionArrayList=new ArrayList<String>();


            	                           while(rs.next()){
            	                        	   if(divisionArrayList.contains(rs.getString(2)))
            	                            	{
            	                            		System.out.println(divisionArrayList);
            	                            		System.out.println("inside break");
            	                            		continue;
            	                            	}
            	                        	   
            	                        	   int count=dcad.getTotalRowsForDivision(rs.getString(2));
            	                            	ResultSet rs1=dcad.getCourseDetailsByDivision(rs.getString(2));
            	                            	while(rs1.next())
            	                            	{
            	                            		divisionArrayList.add(rs1.getString(2));
            	                            		if(cnt==count)
            	                                	{
            	                                		flag=1;
            	                                	}
												 %>
            	                                <tr>
            	                                   <%
													if(flag==1 && cnt<=1)
													{
												   %>
													<td><%=srNo%></td>
													<td><%=rs1.getString(2)%></td>
													<%--<td><%=rs1.getString(3) %></td>
													<td><%=rs1.getString(4) %></td>  --%> 
									 <% 
										}
										if(flag==0 && cnt<=1)
										{
											
            	                      %>
            	                      <td rowspan='<%=count %>'><%=srNo%></td>
									  <td rowspan='<%=count %>'><%=rs1.getString(2)%></td>
									  <% 
										}
										
									%>
									 <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=rs1.getString(3) %></td>
									<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=rs1.getString(4) %></td>
            	                    </tr>
									<%
									if(cnt==count)
									{
										srNo++;
										flag=0;
										cnt=1;
									}
									else
									{
										cnt++;
									}
									
                            	}
                            	
                            	
									
                            	}
                        	
                            }catch(Exception e){
                            	e.printStackTrace();
                            }
            	}
    	}  %>
                       
                              </tr>
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
            	
    	<%
	  session.removeAttribute("Res");
      session.removeAttribute("status-fail");
	  session.removeAttribute("Result");


  %>
      
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script> 
       <script  src="js/form.js"></script> 
</body>


</body>
</html>