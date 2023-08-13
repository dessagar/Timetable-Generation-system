<%@page import="com.dao.DivisionDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.FacultyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Load Distribution | GPP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/form.css">
    <style type="text/css">
    
    label {
  display: block;
  padding-left: 15px;
  text-indent: -15px;
 
}
input {
  width: 13px;
  height: 13px;
  padding: 0;
  margin:0;
  vertical-align: bottom;
  position: relative;
  top: -1px;
  overflow: hidden;
}
    </style>
    
     <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</head>
<body>

<%@ include file="html/sidenav.html" %>


<script type="text/javascript">
 			var xmlHttp;
 		
 			function showOfferedCourses(str)
 			{
 				console.log('hello in courses'+str);
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
 				var url="OfferedCoursesDropdown?division="+str;
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
 					document.getElementById("offered_courses").innerHTML=xmlHttp.responseText;
 				}
 			}
 			
 		
 			function showThPractTut(str)
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
 				var url="DisplayThPractTut?course="+str;
 				xmlHttp.onreadystatechange=printThPractTut;
 				xmlHttp.open("POST",url,true);
 				xmlHttp.send(null);
 				
		 		 	
		 		
 				
 			}
 			function printThPractTut()
 			{
 				
 				if(xmlHttp.readyState===4 ||xmlHttp.readyState==='complete')
 				{
 					document.getElementById("ThPractTut").innerHTML=xmlHttp.responseText;
 					var theoryHr=document.getElementById('thHr').value;
 		 			var practicalHr=document.getElementById('prHr').value;
 		 			var tutorialHr=document.getElementById('tutHr').value;
 		 			console.log('theory = '+theoryHr+' practHr = '+practicalHr+' tuthr = '+tutorialHr);
 		 			var x=document.getElementById("practicalno");
		 		 	var y=document.getElementById("tutorialno");
		 		 	
		 		 	
		 		 	if(x.length>0 || y. length>0)
	 				{
		 		 		var i=x.length
		 		 		while(i>=0){
	 					x.remove(i)
	 					i--;
		 		 		}
	 					var i=y.length
		 		 		while(i>=0){
	 					y.remove(i)
	 					i--;
	 					console.log("In if block of x")
		 		 		}
	 				}
		 		 
 		 			
 		 			
 		 		 		var option;
	 		 			var i=0;
	 		 			var j=0
 		 			while(practicalHr>=0){
 		 				
 		 				option=document.createElement("option")
 		 				
 		 				option.text=i;
 		 				x.add(option,x[i+1])
 		 				practicalHr--;
 		 				console.log(i);
 		 				console.log(theoryHr);
 		 				i++;
 		 				
 		 				
 		 				
 		 				
 		 			} 
 		 			
 		 			while(tutorialHr>=0){
 		 				
 		 				option=document.createElement("option")
 		 				
 		 				option.text=j;
 		 				y.add(option,y[i+1])
 		 				tutorialHr--;
 		 				console.log(j);
 		 				console.log(tutorialHr);
 		 				j++;
 		 		
 		 			} 
 				
 			
 			}
 			}
 			
 			function disablePracticalCheckbox(str){
 				
		 		 	var pch1=document.getElementById("p1");
		 		 	var pch2=document.getElementById("p2");
		 		 	var pch3=document.getElementById("p3");
 				if(str==='0'){
 	
 		 				pch1.disabled=true;
 		 				pch2.disabled=true;
 		 				pch3.disabled=true;
 				}else{
 						pch1.disabled=false;
 		 				pch2.disabled=false;
 		 				pch3.disabled=false;
 					}
 			}
 			function disableTutorialCheckbox(str){
 					var tch1=document.getElementById("t1");
		 		 	var tch2=document.getElementById("t2");
		 		 	var tch3=document.getElementById("t3");
		 		 	console.log(str);
 					if(str==='0'){
 	
 		 				tch1.disabled=true;
 		 				tch2.disabled=true;
 		 				tch3.disabled=true;
 					}
 					else{
 						tch1.disabled=false;
 		 				tch2.disabled=false;
 		 				tch3.disabled=false;
 					}
 					
 			}
 			
 		 /* 	function practicalBatches(str)
 			{
 				console.log('hello in practicalBatches'+str);
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
 				var url="PracticalBatchesCheckbox?division="+str;
 				xmlHttp.onreadystatechange=printPracticalBatches;
 				xmlHttp.open("POST",url,true);
 				xmlHttp.send(null);
 				
 				
 			}
 			function printPracticalBatches()
 			{
 				console.log('print practical batches')
 				if(xmlHttp.readyState===4 ||xmlHttp.readyState==='complete')
 				{
 					console.log('inside if of print practical batches')
 					document.getElementById("PracticalBatches").innerHTML=xmlHttp.responseText;
 					//tutorialBatches(localStorage.getItem('div'))
 				}
 			}
 			
 			function tutorialBatches(str)
 			{
 				console.log('hello in tutorialBatches'+str);
 				
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
 				var url="TutorialBatchesCheckbox?division="+str;
 				xmlHttp.onreadystatechange=printTutorialBatches;
 				xmlHttp.open("POST",url,true);
 				xmlHttp.send(null);
 				
 				
 				
 			}
 			
 			function printTutorialBatches()
 			{
 				console.log('print tutorial batches')
 				if(xmlHttp.readyState===4 ||xmlHttp.readyState==='complete')
 				{
 					console.log('inside if of print tutorial batches')
 					document.getElementById("TutorialBatches").innerHTML=xmlHttp.responseText;
 				}
 			} */
 			 

 		</script>
 		
 		

  <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        
        <%
        	if(!session.isNew())
			{   
        		String loadDistribute_success=(String)session.getAttribute("loadDistribute-success");
        		if(loadDistribute_success=="true")
        		{
        %>
        			<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'success',
       						title: 'Load Distributed Successfully.',
       						showConfirmButton: false,
       						timer: 1500,
     					})
 
  					</script>
  		<% 
        		}

			}
        
        session.removeAttribute("loadDistribute-success");
        %>
        
        <%
        	if(!session.isNew())
			{   
        		String loadDistribute_error=(String)session.getAttribute("loadDistribute-error");
        		if(loadDistribute_error=="true")
        		{
        %>
        			<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Invalid Load Distribution.',
       						showConfirmButton: false,
       						timer: 1500,
     					})
 
  					</script>
  		<% 
        		}

			}
        
        session.removeAttribute("loadDistribute-error");
        %>
          
        <%
        	if(!session.isNew())
			{   
        		String duplicateLoad_error=(String)session.getAttribute("duplicateLoad-error");
        		if(duplicateLoad_error=="true")
        		{
        %>
        			<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Duplicate Load Distributed...Try Again',
       						showConfirmButton: false,
       						timer: 1500,
     					})
 
  					</script>
  		<% 
        		}

			}
        
        session.removeAttribute("duplicateLoad-error");
        %>
        <h2 class="title" style="font-size: 30px">Load Distribution</h2>
        <form class="row g-3 needs-validation" action="LoadDistributionController" method="post" novalidate>
           

            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Faculty</label>
              <select class="form-select" id="validationCustom04" name="faculty_id" style="font-size: 17px" required>
                <option selected disabled value="" style="font-size: 17px">Faculty</option>
                <%
                	FacultyDao fdao=new FacultyDao();
                	ResultSet rs=fdao.getFacultyDetails();
                	while(rs.next())
                	{
                %>
                	<option style="font-size: 17px" value="<%=rs.getInt(1) %>" ><%=rs.getString(2) %></option>
                <%
                	}
                %>
              

              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                Please select a Faculty.
              </div>
            </div>
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Division</label>
              <select class="form-select" id="divName" name="division_name" onchange="showOfferedCourses(this.value)" style="font-size: 17px" required>
                <option selected disabled value="" style="font-size: 17px">Division</option>
                <%
                	DivisionDao ddao=new DivisionDao();
                	rs=ddao.getDivisionDetails();
                	while(rs.next())
                	{
                %>
                	<option style="font-size: 17px"><%=rs.getString(2) %></option>
                <%
                	}
                %>
               
              </select>
              
              <div class="invalid-feedback" style="font-size: 17px">
                Please select a Division.
              </div>
            </div>
           
            <br><br><br>  <br><br><br> 
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Offered Courses</label>
              <select class="form-select"  name="offered_course"  id="offered_courses" onchange="showThPractTut(this.value)" style="font-size: 17px" required>
                <option selected disabled value="" style="font-size: 17px">Offered Courses</option>
              </select>
              <div class="invalid-feedback">
                Please select a Course.
              </div>
            </div>
                       
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px">Theory [Yes/No]</label><br>
              <select class="form-select" id="validationCustom04" name="theory" style="font-size: 17px" required>
                <option selected disabled value="" style="font-size: 17px">Theory</option>
                <option style="font-size: 17px">Yes</option>
                <option style="font-size: 17px">No</option>
              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                Please select The Option.
              </div>
            </div>


            
			
            <div class="col-md-12" style="display: inline;" id="ThPractTut">
            <!-- 
              <div class="d-inline-block" ><h4 style="font-size: 17px">Theory :</h4></div>
              <div class="d-inline-block" style="font-size: 17px"><h4 style="font-size: 17px">Practical : </h4></div>
              <div class="d-inline-block" style="font-size: 17px"><h4 style="font-size: 17px">Tutorials: </h4></div> -->
            
            </div> 
            
            <script type="text/javascript">
 			
 		</script> 
            
         <br><br><br>  <br><br><br>  
            <div class="col-md-6">
              <label for="validationCustom04" class="form-label"  style="font-size: 17px">Practical</label>
              <select class="form-select" id="practicalno" name="practical_hours"  style="font-size: 17px" onchange="disablePracticalCheckbox(this.value)" required>
                <option selected disabled value=""  style="font-size: 17px">Practicals</option>
               <!--  <option  style="font-size: 17px">0</option>
                <option  style="font-size: 17px">1</option>
                <option  style="font-size: 17px">2</option>
                <option  style="font-size: 17px">3</option>
                <option  style="font-size: 17px">4</option> -->
              </select>
              <div class="invalid-feedback"  style="font-size: 17px">
                Please select a Practical hours.
              </div>
            </div> 
            
             <div class="col-md-6">
              <label for="validationCustom04" class="form-label"  style="font-size: 17px">Tutorials</label>
              <select class="form-select" id="tutorialno" name="tutorial_hours"  style="font-size: 17px" onchange="disableTutorialCheckbox(this.value)" required>
                <option selected disabled value=""  style="font-size: 17px">Tutotials</option>
             <!--    <option  style="font-size: 17px">0</option>
                <option  style="font-size: 17px">1</option>
                <option  style="font-size: 17px">2</option>
                 -->
              </select>
              <div class="invalid-feedback"  style="font-size: 17px">
                Please select a Tutorials hours.
              </div>
            </div>    
				
				<br><br><br>  <br><br><br>  <br><br><br>
           <div class="col-md-6" id="PracticalBatches">
              <label for="validationCustom04"  style="font-size: 17px" class="form-label"  style="font-size: 17px">Practical Batches</label><BR><BR>
             
          
			
 	<div>
        <label style="font-size: 17px; font-weight: normal;"> <input type="checkbox" id="p1" name="a" style="zoom:1.5;" />	A Batch</label><br><br>
    </div>
     <div>
        <label style="font-size: 17px; font-weight: normal;"><input type="checkbox" id="p2" name="b"  style="zoom:1.5;"/> B Batch</label><br><br>
    </div>
     <div>
        <label style="font-size: 17px; font-weight: normal;"><input type="checkbox"  id="p3" name="c" style="zoom:1.5;" /> C Batch</label>
    </div> 
  			</div>
            
             
            
            <br><br><br>  <br><br><br>  <br><br><br>
            <div class="col-md-6" id="TutorialBatches">
              <label for="validationCustom04" class="form-label"  style="font-size: 17px">Tutorials Batches</label><br><br>
              <div>
        <label style="font-size: 17px; font-weight: normal;"> <input type="checkbox" id="t1" name="t1" style="zoom:1.5;" /> T1 Batch</label><br><br>
    </div>
     <div>
        <label style="font-size: 17px; font-weight: normal;"><input type="checkbox" id="t2" name="t2" style="zoom:1.5;"/> T2 Batch</label><br><br>
    </div>
     <div>
        <label style="font-size: 17px; font-weight: normal;"><input type="checkbox" id="t3" name="t3" style="zoom:1.5;" /> T3 Batch</label>
    </div> 
  			</div>
            

            <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Register Load</button>
            </div>
            

          </form>
       
        </form>
        </div>
        </div>
        </div>
        </div>
        
<script src="js/form.js"></script> 

</body>
</html>