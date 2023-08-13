<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.TimeTableGenerationDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.DivisionDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
      <link rel="stylesheet" href="css/form.css">
          <link rel="stylesheet" href="css/table.css">
      
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet"> 
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
   
  <script src="https://kit.fontawesome.com/a4f00a5269.js" crossorigin="anonymous"></script>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    	<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
    
    
    <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   
<title>Timetable Generation Details | GPP</title>
</head>
<body>
<%@ include file="html/sidenav.html" %>

	<script type="text/javascript">
	function ExportToExcel(type, fn, dl) {
		console.log("Hello in excel")
	       var elt = document.getElementById('tbl_exporttable_to_xls');
	       var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
	       return dl ?
	         XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }):
	         XLSX.writeFile(wb, fn || ('Time Table Generation.' + (type || 'xlsx')));
	    }
	</script>

<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h5 class="title" style="font-size: 30px">Time Table Details</h5>
        <form class="row g-3 needs-validation" action="TimeTableGenerationDetails.jsp" method="post" novalidate>
           
        <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Division</label>
              <select class="form-select" style="font-size: 17px" id="validationCustom04" name="division" onChange="getMainTerm()" required>
                <option selected disabled value="">Choose...</option>
                 <%
                try{
               	DivisionDao dd=new DivisionDao();
               	ResultSet rs=dd.getDivisionNames();
          		while(rs.next())
          		{
                %>
                <option style="font-size: 17px"><%=rs.getString(1) %></option>
                <%
          		}
                }catch(Exception e){
                	e.printStackTrace();
                }
                %>              
	              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select Division
              </div>
            </div>
           
            
          

      <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Show Timeteble</button>
            </div>
          </form>
       
       
        </div>
        </div>
        </div>
        </div>
        
       <%--   <%
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

        		%> --%>
        		 <div class="container" style=margin-top:-250px margin-left: 200px;">
        	        <div class="row">
        	            <div class="col-md-offset-1 col-md-10">
        	                <div class="panel">
        	                    <div class="panel-heading">
        	                        <div class="row">
        	                            <div class="col col-md-6 col-xs-12">
        	                                <h4 class="title">Time Table Details </h4>
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
            	                        <table class="table " id="tbl_exporttable_to_xls">
            	                            <thead>
            	                                
            	                                    <th>Day</th>
            	                                    <th>08:00-09:00</th>
            	                                    <th>09:00-10:00</th>
            	                                    <th>10:00-11:00</th>
            	                                    <th>11:00-12:00</th>
            	                                    <th>12:00-13:00</th>
            	                                    <th>13:00-14:00</th>
            	                                    <th>14:00-15:00</th>
            	                                    <th>15:00-16:00</th>
            	                                    <th>16:00-17:00</th>
            	                                    <th>17:00-18:00</th>
            	                                    <th>18:00-19:00</th>
            	                                    <th>19:00-20:00</th>
            	                  
            	                            </thead>
            	 <ol id="list">
                                    <tbody>
                                    <%
										String day[]={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}; 
                                    	String slot[]={"08:00-09:00","09:00-10:00","10:00-11:00","11:00-12:00","12:00-13:00","13:00-14:00","14:00-15:00","15:00-16:00","16:00-17:00","17:00-18:00","18:00-19:00","19:00-20:00"};
                                    	int cnt=0;
                                    	int flag=0;
                                    	int counter=0;
                                    	
                                    	
                                    	
                                    	ResultSet rs2=null;
                                    	ArrayList<String> time=new ArrayList<String>();
                                    	ArrayList<Integer> chkOff=new ArrayList<Integer>();
                                    	
                                    	TimeTableGenerationDao ttgd=new TimeTableGenerationDao();
                          				String div=request.getParameter("division");
                          				System.out.println(div);
                          			
                                    	
                                    	 while(cnt<6)
                                    	{ 
                                    		 counter=0;
                                    	
                                    %>
                                    
                                    		<tr>
                                    		<td style="color: #fff;background-color: #42498f ;font-size: 16px;font-weight: 1000;text-transform: uppercase;padding: 15px 20px;border: 2px solid black;"><%=day[cnt] %></td>
                                    		
                                    <% 
                                    while(counter<slot.length)
                            		{
                                    	
                            		System.out.println("slot array length "+slot.length);
                                    try{
                                    		System.out.println("Day "+day[cnt]);
                                    		ResultSet rs=ttgd.getTimeTableByDay(div,day[cnt],slot,counter);
                                    		if(!rs.isBeforeFirst())
                                    		{
                                    			if(!chkOff.contains(1))
                                    			{
                                    		
                                    	%>
                                    		<td>OFF</td>
                                    	<% 
                                    			
                                    			}
                                    			else
                                    			{
                                    				chkOff.clear();
                                    			}
                                    		}
                                    		while(rs.next())
                                    		{
                                    			
                                    		
                                    			int nft=Integer.parseInt(rs.getString(5).substring(0, 2));
                                    			int ntt=Integer.parseInt(rs.getString(6).substring(0,2));
                                    			
                                    			if((ntt-nft)>1)
                                    			{
                                    				chkOff.add(1);
                                    			}
                                    			
                                    		
                                    			
                                    			System.out.println("inside main rs");
                                    			System.out.println("course  and faculty ::: "+rs.getString(2)+" "+rs.getString(7));
                                    			
                                    			if(time.contains(rs.getString(5)+"-"+rs.getString(6)))
                                    			{
                                    				
                                    			System.out.println("inside continue");
                                    				continue;
                                    			}
                                    			StringBuilder sb=new StringBuilder();
                                    			sb.setLength(0);
                                    		
                                    			nft=Integer.parseInt(rs.getString(5).substring(0, 2));
                                    			ntt=Integer.parseInt(rs.getString(6).substring(0,2));
                                    			
                                    				rs2=ttgd.getDuplicateRow(div,rs.getString(5), rs.getString(6), day[cnt]);
                                    				while(rs2.next())
                                        			{
                                    					
                                        				String course=rs2.getString(2);
                                        				String head=rs2.getString(3);
                                        				
                                        				
                                    					String faculty=rs2.getString(7);
                                    					String practBatch=rs2.getString(8);
                                    					 if(practBatch==null)
                                    					{
                                    						practBatch="";
                                    					} 
                                    					 else
                                    					 {
                                    						 practBatch=practBatch.substring(0,1).toUpperCase();
                                    					 }
                                    					String tutBatch=rs2.getString(9);
                                    					if(tutBatch==null)
                                    					{
                                    						tutBatch="";
                                    					} 
                                    					else
                                   					 	{
                                   						 	tutBatch=tutBatch.substring(0,2).toUpperCase();
                                   					 	}
                                    					String classRoom=rs2.getString(10);
                                        			
                                        				time.add(rs2.getString(5)+"-"+rs2.getString(6));
                                    					flag=1;
                                        				
                                        				if(head.equals("Break"))
                                        				{
                                        					sb.append("BREAK");
                                        				}
                                        				else
                                        				{
                                        					//sb.append(course.substring(8)+"-"+head+"-"+practBatch+"-"+tutBatch+"-"+faculty+"-"+classRoom+"<hr>");
                                        					sb.append(course+"-"+head.substring(0,2).toUpperCase()+"-"+practBatch+"-"+tutBatch+"-"+faculty+"-"+classRoom+"<hr>");
                                        				}
                                        			}
                                    				
                                    			if(flag==1)
                                    			{
                                    				if((ntt-nft)>1)
													{
                                    					System.out.println("String builder "+sb);
													
                                    	%>
                                    					<td colspan="2"><%=sb%></td>
                                    	<% 
													}
                                    				else
                                    				{
                                    	%>
                                    					<td><%=sb%></td>
                                    	<% 
                                    				}
                                    			}
                                    			else if(flag==0)
                                    			{
                                    	%>
											<%
													System.out.println("rs.getString(2) "+rs.getString(2));
													if((ntt-nft)>1)
													{
														System.out.println("============================================"+rs.getString(6));

													%>
														<%-- <td colspan="2"><%=rs2.getString(5)+"-"+rs2.getString(6)%></td>	 --%>
														<td colspan="2"><%=rs.getString(2)+" "+rs.getString(7)%></td>	
													<% 
													}
													else
													{
														System.out.println("============================================"+rs.getString(6));
														
													%>
														<%-- <td><%=rs2.getString(5)+"-"+rs2.getString(6)%></td> --%>
														
														 <td><%=rs.getString(2)+" "+rs.getString(7)%></td> 
													<% 
													}
													%>
													
													<!-- <td>aaa</td>
													<td>bbb</td> 
													<td>ccc</td>
									  				<td> ddd</td>
													<td>fff</td>
													<td>ggg</td>
													<td>ggg</td> -->
            	                    			
            	                    			
            	                    	<% 
                                    			}
                                    			
                                    	}
                                    		
                            		
                                    	}catch(Exception e){
                            				e.printStackTrace();
                            			}
                                    	
                                    %>
                                    		
                                   
                                    <% 
                                    
                                    counter++;
                                    System.out.println("Counter "+counter);
                            		}
                                    
                                       cnt++;
                                       time.clear();
                                    	} 
        	
                                    	
                                    %>
            	                            
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
          
           <script type="text/javascript">
        function Export() {
        	
        	console.log("inside export fnunction")
            html2canvas(document.getElementById('tbl_exporttable_to_xls'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 550
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Time Table Generation.pdf");
                }
            });
        }
    </script> 	
    	
</body>
</html>