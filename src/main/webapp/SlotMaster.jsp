<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Master | GPP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="css/form.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.1/js/bootstrap-timepicker.min.js" integrity="sha512-EZdEBpNPE+70rtKYtzP15/ILLNsFcrvipSKCTMT09zGlnV5/6M6WEPc+ZVWyF/uCg1Xl74YLI23N07F+SeTqJA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.1/js/bootstrap-timepicker.js" integrity="sha512-zw9zTsDMm8dym+RdxnKPoVk8zoc3keE/mBgG3FeQbcVK9Arc0LfUPf+NdklUCDKuIJ61m6rwQkxKk6wPR1Lzdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

    // Below code sets format to the
    // datetimepicker having id as
    // datetime
    $('#datetime').datetimepicker({
        format: 'hh:mm:ss a'
    });
</script>
 <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
    <%@ include file="html/sidenav.html" %>
    
   <%
			if(!session.isNew())
			{
				session=request.getSession();
				String error=(String)session.getAttribute("error");
				if(error=="true")
	        	{
		%>
					<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'error',
       						title: 'Slot is Already Registered, please enter Another Slot',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  					
  			<% 
	        	}
				
			}
        session.removeAttribute("error");
        
        %>
        
        
        <%
			if(!session.isNew())
			{
				session=request.getSession();
				String slot_success=(String)session.getAttribute("slot-success");
				if(slot_success=="true")
	        	{
		%>
					<script type="text/javascript">
				
    				Swal.fire({
      				//  position: 'top-end',
       						icon: 'success',
       						title: 'Slot Registered Successfully.',
       						showConfirmButton: false,
       						timer: 2000,
     					})
 
  					</script>
  					
  			<% 
	        	}
				
			}
        session.removeAttribute("slot-success");
        
        %>
        
   
   
    <div id="head"> </div>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
        <div class="card card-4">
        <div class="card-body">
        <h2 class="title">Slot Master</h2>
        <form class="row g-3 needs-validation" novalidate action="SlotMasterController" method="post">

            <div class="col-md-12">
              <label for="validationCustom04" class="form-label">Day</label>
              <select class="form-select" name="day" style="font-size: 17px" id="validationCustom04" required>
                <option selected disabled value="">Day</option>
                <option style="font-size: 17px">Monday</option>
                <option style="font-size: 17px">Tuesday</option>
                <option style="font-size: 17px">Wednesday</option>
                <option style="font-size: 17px">Thursday</option>
                <option style="font-size: 17px">Friday</option>
                <option style="font-size: 17px">Saturday</option>
              </select>
              <div  class="invalid-feedback" style="font-size: 17px">
                Please select a Day.
              </div>
            </div>
           
            <div class="col-md-6">
                <label for="validationCustom04" class="form-label" style="font-size: 17px">Select time [From]</label>
                    <input type="time" id="appt" name="fromtime" style="font-size: 17px">
             </div>
             <div  class="invalid-feedback" style="font-size: 17px">
                Please select From Time.
              </div>
             
             
             <div class="col-md-6">
                <label for="validationCustom04" class="form-label" style="font-size: 17px">Select time [To]</label>
                    <input type="time" id="appt" name="totime" style="font-size: 17px">
             </div>
             <div class="invalid-feedback" style="font-size: 17px">
                  Please select To Time.
                </div>
             
            <div class="col-12">
              <button class="btn btn-primary" type="submit" style="font-size: 17px">Register Slot</button>
            </div>
          </form>
       
        </form>
        </div>
        </div>
        </div>
        </div>
        
<script src="js/form.js"></script>      
</html>