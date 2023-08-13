<%@page import="java.util.Collections"%>
<%@page import="com.model.Class"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.dao.BuildingDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.ClassDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class Master | GPP</title>
<script type="text/javascript">
(function () {
    'use strict'
  
    var forms = document.querySelectorAll('.needs-validation')
  
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
  
          form.classList.add('was-validated')
        }, false)
      })
  })()
  function manage(txt) {
    var bt = document.getElementById('submit');
    var ele = document.getElementsByTagName('input');

    // Loop through each element.
    for (i = 0; i < ele.length; i++) {

      // Check the element type
      if (ele[i].type == 'text' && ele[i].value == '') {
        bt.disabled = true;    // Disable the button.
        return false;
      }
      else {
        bt.disabled = false;   // Enable the button.
      }
    }
  }

function manage(pwd) {
    var bt = document.getElementById('submit');
    var ele = document.getElementsByTagName('input');

    // Loop through each element.
    for (i = 0; i < ele.length; i++) {

      // Check the element type
      if (ele[i].type == 'password' && ele[i].value == '') {
        bt.disabled = true;    // Disable the button.
        return false;
      }
      else {
        bt.disabled = false;   // Enable the button.
      }
    }
  }


  // $(".toggle-password").click(function() {

  //   $(this).toggleClass("fa-eye fa-eye-slash");
  //   var input = $($(this).attr("toggle"));
  //   if (input.attr("type") == "password") {
  //     input.attr("type", "text");
  //   } else {
  //     input.attr("type", "password");
  //   }
  // });

  const togglePassword = document.querySelector('#togglePassword');
  const password = document.querySelector('#desig');

  togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye / eye slash icon
    this.classList.toggle('bi-eye');
});
  </script>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Building Master | GPP</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>


     <link rel="stylesheet" href="css/form.css">

     <script type="text/javascript">     
      function isNumber(evt) {
              evt = (evt) ? evt : window.event;
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if ( (charCode > 31 && charCode < 48) || charCode > 57) {
                  return false;
              }
              return true;
          }
      </script>
      <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
 		<%@ include file="html/sidenav.html" %>
 		
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
 				var url="ClassMasterDropdown?building="+str;
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
 		
<!--  		<div id="header"></div>
 --> 		
 		<!-- <script type="text/javascript"> -->
				
    <%-- <%
    	if(!session.isNew())
    	{
    		session=request.getSession();
        	String str=(String)session.getAttribute("success_msg");
     %>
     <script type="text/javascript">
		
     Swal.fire({
       //  position: 'top-end',
        icon: 'success',
        title: <%=str%>,
        showConfirmButton: false,
        timer: 2500
      })
  
   </script>	
     
     <%
     
    	}
    	session.invalidate();
    	
    %>  --%>
    <%
    	
    
    %>
 
  
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        
        <%
			if(!session.isNew())
			{
				session=request.getSession();
				String success=(String)session.getAttribute("class-success");
				if(success=="true")
	        	{
		%>
					<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'success',
       						title: 'Class Registered Successfully.',
       						showConfirmButton: false,
       						 timer: 1500, 
       						
       							/* title: '<strong>HTML <u>example</u></strong>',
       						  icon: 'info',
       						  html:
       						    'You can use <b>bold text</b>, ' +
       						    '<a href="//sweetalert2.github.io">links</a> ' +
       						    'and other HTML tags',
       						  showCloseButton: true,
       						  showCancelButton: true,
       						  focusConfirm: false,
       						  confirmButtonText:
       						    '<i class="fa fa-thumbs-up"></i> Great!',
       						  confirmButtonAriaLabel: 'Thumbs up, great!',
       						  cancelButtonText:
       						    '<i class="fa fa-thumbs-down"></i>',
       						  cancelButtonAriaLabel: 'Thumbs down' */
     					})
 
  					</script>
  					
  			<% 
	        	}
				
			}
        session.removeAttribute("class-success");
        
        %>
        <%
			if(!session.isNew())
			{
				session=request.getSession();
				String error=(String)session.getAttribute("Duplicate_class");
				if(error=="true")
	        	{
		%>
					<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Class Name Already Registered, Try with Another Class Name.',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  					
  			<% 
	        	}
				
			}
        session.removeAttribute("Duplicate_class");
        
        %>
        
        <h2 class="title" style="font-size: 30px">Class Details</h2>
        <form action="ClassMasterController" method="post" class="row g-3 needs-validation" novalidate>
            <div class="col-md-7">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Class Name</label>
              <input type="text" class="form-control" name="class_name" id="validationCustom01" value="" style="font-size: 17px" required autocomplete="off" >
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
            
            
            
            
           <!--  <div class="col-md-10">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">No of floors:</label>
              <input type="text" class="form-control textfield" name="no_of_floors" id="validationCustom01" style="font-size: 17px" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div> -->
           
            <!-- <div class="col-md-12">
              <label for="validationCustom01" style="font-size: 17px" class="form-label">Number of classrooms:</label>
              <input type="text" class="form-control textfield" id="validationCustom01" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" style="font-size: 17px" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>

            <div class="col-md-12">
              <label for="validationCustom01" class="form-label" style="font-size: 17px">No of labs:</label>
              <input type="text" class="form-control textfield" id="validationCustom01" value="" id="onlyNumbers" name="onlyNumbers" onkeypress="return isNumber(event)" onpaste="return false;" style="font-size: 17px" required>
              <div class="valid-feedback" style="font-size: 17px">
                Looks good!
              </div>
            </div>

            <div class="col-md-6">
              <label for="validationCustom04" class="form-label" style="font-size: 17px" >Course</label>
              <select class="form-select" style="font-size: 17px" id="validationCustom04" required>
                <option selected disabled value="">Choose...</option>
                <option style="font-size: 17px">Web Devlopment</option>
                <option style="font-size: 17px">DataBase</option>
                <option style="font-size: 17px">Java</option>
              </select>
              <div class="invalid-feedback" style="font-size: 17px">
                 Please select a Course.
              </div>
            </div>
           
            <div class="col-12">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" style="font-size: 17px" required>
                <label class="form-check-label" style="font-size: 17px" for="invalidCheck">
                  Agree to terms and conditions
                </label>
                <div class="invalid-feedback" style="font-size: 17px">
                  You must agree before submitting.
                </div>
              </div>
            </div> -->
            <div class="col-12">
              <button class="btn btn-success" type="submit" style="font-size: 17px"; text-align:"center";> <i class="fas fa-plus"></i> Add Class</button>
            </div>
          </form>
       
        </div>
        </div>
        </div>
        </div>
        
<script src="js/form.js"></script>        
 </body>
       </html>