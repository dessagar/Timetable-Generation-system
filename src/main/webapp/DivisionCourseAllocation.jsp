<%@page import="com.dao.DivisionDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.OfferedCourseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Division Course Allocation | GPP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
      <link rel="stylesheet" href="css/form.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet"> 
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
   
  <script src="https://kit.fontawesome.com/a4f00a5269.js" crossorigin="anonymous"></script>
 
  
   
   <!-- multiselect dropdown links -->   
<!--    <script>
   $('select').selectpicker();
    </script> -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
      
         <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
</head>
<body>


	<%@ include file="html/sidenav.html" %>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
         <%
    	
    	if(!session.isNew())
    	{
    		//session=request.getSession();
        	String success=(String)session.getAttribute("allotedCourse-Success");
        	if(success=="true")
        	{
     %>
    				<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'success',
       						title: 'Courses Alloted to Division Successfully.',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  <%
		}
	}
	/* session.invalidate(); */
	session.removeAttribute("allotedCourse-Success");
  %>
  
   <%
    	
    	if(!session.isNew())
    	{
    		//session=request.getSession();
        	String error=(String)session.getAttribute("Duplicate_courseAllocation");
        	if(error=="true")
        	{
     %>
    				<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Course is already Allocated to this Division, Please chek Once and Try Again.!',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  <%
		}
	}
	/* session.invalidate(); */
	session.removeAttribute("Duplicate_courseAllocation");
  %>
        <script type="text/javascript">
  			var year,term;
  			var mainTerm;
  			var xmlHttp;
  			function getYear(str)
  			{
  				year= str;
  				console.log(year)
  			}
            function getTerm(str)
            {
            	term=str;
            	console.log(term)
            }
            
            function getMainTerm()
            {
            	
            	mainTerm=term+year;
            	console.log(mainTerm)
            	
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
    			var url="GetCourse?term="+mainTerm;
    			xmlHttp.onreadystatechange=stateChange;
    			xmlHttp.open("POST",url,true);
    			xmlHttp.send(null);
            	
            }
            function stateChange()
    		{
    			console.log('hello in printcourses')
    			if(xmlHttp.readyState===4 ||xmlHttp.readyState==='complete')
    			{
    				console.log('hello in if of courses')
    				console.log(xmlHttp.responseText)
    				document.getElementById("courseOption").innerHTML=xmlHttp.responseText;
    			}
    		}
            
           
            </script> 
        
        <h5 class="title" style="font-size: 30px"> Division Course Allocation</h5>
        <form class="row g-3 needs-validation" action="DivisionCourseAllocationController" method="post" novalidate>
           
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Term</label>
              <select class="form-select" id="term" style="font-size: 17px" name="term" onChange="getTerm(this.value)" required>
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
               
                <input type="text" class="form-control" autocomplete="off" name="year" id="datepicker" onChange="getYear(this.value)" />

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
           
            
          
            <div class="col-md-6 ">
               <label for="validationCustom04" class="form-label" style="font-size: 17px" >Course Name</label><br>
           	
 					<select class=" form-label" style="font-size: 17px;" id="courseOption" name="course" multiple data-live-search="true">
 							
	              </select>  
	              
	              
	              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
	              <div class="invalid-feedback" style="font-size: 17px">
<

              </div>
	        </div>
	        
	        
            <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Offer Courses</button>
            </div>
          </form>
       
       
        </div>
        </div>
        </div>
        </div>
      
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script> 
       <script  src="js/form.js"></script> 
</body>
</html>