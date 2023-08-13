<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
   	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
       <script src="https://kit.fontawesome.com/a4f00a5269.js" crossorigin="anonymous"></script>
   
  <link rel="stylesheet" href="css/admin_login.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <style> 

@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@300&display=swap');
</style>

<meta charset="ISO-8859-1">
<title>Admin | Login</title>
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>


</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

	<nav class="navbar navbar-light fixed-top">
      <div class="gpp_image fixed-top" >
      </div>
    </nav>
    
     <%
                		if(!session.isNew())
                		{
						String error_msg=(String)session.getAttribute("error_msg");
						if(error_msg!=null)
						{
				%>
							<script type="text/javascript">
		
     						Swal.fire({
       						//  position: 'top-end',
        					icon: 'error',
        					title:'Oops..!!',
        					text: 'Invalid Credentials , Please Try Again..!',
        					showConfirmButton: true,
        						
      					})
  
   							</script>	
				<%
						}
                	}
/*  		session.removeAttribute("error_msg");
 */		session.invalidate();

 


                 		
				%> 
	<section class="ftco-section">
		<div class="container">
			
			<div class="row justify-content-center" >
				<div class="col-md-7 col-lg-5" >
					<div class="login-wrap p-4 p-md-5">
		      	<div class="icon d-flex align-items-center justify-content-center">
		      		<span class="fa fa-user-o"></span>
		      	</div>
		      	<h3 class="text-center mb-4">Sign In</h3>
						<form action="AdminLoginController" class="login-form">
		      		<div class="form-group">
		      			<input type="text" id="validationCustom04" autocomplete="off" style="width: 300px;margin-left: 20px" class="form-control" placeholder="Username" name="uname" required>
		      		</div>
		      		
	            <div class="form-group d-flex">
	              <input type="password" id="validationCustom04" autocapitalize="off" style="width: 300px;margin-left: 20px" class="form-control" placeholder="Password" name="pass" required >
	            </div>

		<div class="form-group">
							<div class="g-recaptcha" style="width: 300px;margin-left: 20px"   data-sitekey="6LfpHp8gAAAAALv2upG2sPnRjXhTWg2dTyL3rOJL" data-callback="enableBtn"></div>		      
							
							</div>

				

	            <div class="form-group">
	            	<button type="submit" id="button1" disabled="disabled" class="form-control btn btn-primary rounded submit px-3"  >Login</button>
	            </div>
	            
	          </form>
	        </div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript">

function enableBtn(){
	
	   document.getElementById("button1").disabled = false;
	 }
  
</script>
<script type="text/javascript">
(function () {
    'use strict'
  console.log('formjs');
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
</script>
<!-- <script src="js/form.js"></script>
 --></body>
</html>