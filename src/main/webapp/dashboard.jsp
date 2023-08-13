<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <script src="https://kit.fontawesome.com/a4f00a5269.js" crossorigin="anonymous"></script>

    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/dashboard.css">


    <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(function(){
            $("#header").load("sidenav.html");
        });
    </script> -->
    <title>Document</title>
    <script type="text/javascript">
    
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
    </script>
    
</head>
<body>
<%
	if(!session.isNew())
	{
		session=request.getSession();
		String success_msg=(String)session.getAttribute("success_msg");

		if(success_msg!=null)
		{
%>
	<script type="text/javascript">
				
    Swal.fire({
      //  position: 'top-end',
       icon: 'success',
       title: 'Admin Logged in Successfully',
       showConfirmButton: false,
       timer: 1500,
     })
 
  </script>
  <% 
		}
		
		session.removeAttribute("success_msg");

	}



	
  %>
		
	

  
    <!-- <div id="header"></div> -->
    <nav class="navbar navbar-light fixed-top">
      <div class="gpp_image fixed-top" >
      </div>
    </nav>

    <!-- Sidenav -->
    <div class="sidebar">
        <div class="logo-details">
          <div class="logo_name">GPP TIMETABLE</div>
          <i class="bx bx-menu" id="btn"></i>
        </div>
        <ul class="nav-list">
        <li>
          <a href="dashboard.jsp">
            <i class="fa-solid fa-home " aria-hidden="true"></i>
            <span class="links_name">DashBoard</span>
          </a>
          <span class="tooltip">DashBoard</span>
        </li>
        <li>
          <a href="BuildingMaster.jsp">
            <i class="fa-solid fa-building " aria-hidden="true"></i>
            <span class="links_name">Building Master</span>
          </a>
          <span class="tooltip">Building Master</span>
        </li>
        <li>
          <a href="ClassMaster.jsp">
            <i class="fa-solid fa-house-laptop"></i>
            <span class="links_name">Class Master</span>
          </a>
          <span class="tooltip">Class Master</span>
        </li>
        <li>
          <a href="DivisionMaster.jsp">
            <i class="fa-solid fa-school"></i>
            <span class="links_name">Division Master</span>
          </a>
          <!-- <span class="tooltip">Question Bank</span> -->
          <span class="tooltip">Division Master</span>
          </li>
           <li>
          <a href="CourseMaster.jsp">
            <i class="fa-solid fa-graduation-cap" aria-hidden="true"></i>
            <span class="links_name">Course Master</span>
          </a>
          <span class="tooltip">Course Master</span>
        </li>
         <li>
          <a href="OfferedCourses.jsp">
            <i class="fa-solid fa-rectangle-list" aria-hidden="true"></i>
            <span class="links_name">Offered Courses</span>
          </a>
          <span class="tooltip">Offered Courses</span>
        </li>
         <li>
          <a href="DivisionCourseAllocation.jsp">
            <i class="fa-solid fa-clipboard-list" aria-hidden="true"></i>
            <span class="links_name">Division Course Allocation</span>
          </a>
          <span class="tooltip">Division Course Allocation</span>
        </li>
        <li>
          <a href="facultyMaster.html">
            <i class="fa-solid fa-person" aria-hidden="true"></i>
            <span class="links_name">Faculty Master</span>
          </a>
          <span class="tooltip">Faculty Master</span>
        </li>
        
         <li>
          <a href="SlotMaster.jsp">
            <i class="fa-solid fa-hourglass"  aria-hidden="true"></i>
            <span class="links_name">Slot Master</span>
          </a>
          <span class="tooltip">Slot Master</span>
        </li>
        <li>
          <a href="../LoadDistribution.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">Load Distribution</span>
          </a>
          <span class="tooltip">Load Distribution</span>
        </li>
        <li>
        <a href="TimeTableGeneration.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">TimeTableGeneration</span>
          </a>
          <span class="tooltip">TimeTableGeneration</span>
        </li>
        
        <li>
          <a href="FacultyTimeTableDetails.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">Faculty Timetable Report</span>
          </a>
          <span class="tooltip">Faculty Report</span>
        </li>
        
        <li>
         <a href="ClassTimeTableDetails.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">Classroom Timetable Report</span>
          </a>
          <span class="tooltip">Classroom Report</span>
        </li>
     <li>
         <a href="ClassTimeTableDetails.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">Classroom Timetable Report</span>
          </a>
          <span class="tooltip">Classroom Report</span>
        </li> 
        <li>
         <a href="ClassTimeTableDetails.jsp">
            <i class="fa-solid fa-chart-line"  aria-hidden="true"></i>
            <span class="links_name">Classroom Timetable Report</span>
          </a>
          <span class="tooltip">Classroom Report</span>
        </li>
          <!-- <li>
           <a href="#">
             <i class='fa fa-check' ></i>
             <span class="links_name">NAVIN ADD KAR</span>
           </a>
           <span class="tooltip">NAVIN ADD KAR</span>
         </li>
     -->
          <!-- <li class="profile">
            <div class="profile-details">
              <img src="#" alt="" />
              <div class="name_job">
                <div class="name">XYZ</div>
                <div class="job">XYZ</div>
              </div>
            </div>
            <a href="logout.html"><i class="bx bx-log-out" id="log_out"></i></a>
          </li> -->
        </ul>
    
      </div>
    <!-- End sidenav -->
    <div class="container mx-auto mt-4">
        <div class="row" style="margin-top: 125px;margin-left: 100px;">
          <div class="col-md-4">
            <div class="card" style="width: 18rem;">
        <!-- <img src="icons/building.png" class="card-img-top" alt="..."> -->
        <img src="icons/building.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <!-- <i class="fas fa-plus"></i> -->
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Building Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
             <a href="BuildingMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="BuildingDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div>    
             <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/classroom.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title"style="text-align: center;" >Class Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="ClassMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="ClassDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div>    
                <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/division.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Division Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="DivisionMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="DivisionDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
        </div>
        
          
          <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="icons/course.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
                <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Course Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="CourseMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="CourseDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>	
        </div>
          </div>   
           <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="icons/Offeredcourses.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
                <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Offered Courses</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="OfferedCourses.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="OfferedCoursesDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>	
        </div>
          </div> 
           <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="icons/divisioncourse.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
                <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Division Course Allocation</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="DivisionCourseAllocation.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="DivisionCourseAllocationDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>	
        </div>
          </div>  
             <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/faculty.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Faculty Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="FacultyMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="FacultyDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div> 
           <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="icons/slot.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
                <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Slot Master</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="SlotMaster.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="SlotDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div>      
                <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/load.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Load DIstribution</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="LoadDistribution.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="LoadDistributionDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
        </div>
         <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/load.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">TimeTable Generation</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <a href="TimeTableGeneration.jsp" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="TimeTableGenerationDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
        </div>
         <div class="col-md-4">
         <div class="card" style="width: 18rem;">
        <img src="icons/faculty.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Faculty Report</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <center><a href="FacultyTimeTableDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a></center>
        </div>
        </div>
        </div>
        
         <div class="col-md-4">
         <div class="card" style="width: 18rem;">
        <img src="icons/classroom.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Classroom Report</h5>
              <!-- <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6> -->
          <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
          <center><a href="ClassTimeTableDetails.jsp" class="btn btn-light "><i class="fa fa-eye"></i> View</a></center>
        </div>
        </div>
        </div>
        
        

        <!-- <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="icons/slot.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
                <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Slot Master</h5>
             
          <a href="#" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="#" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div>    
             <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/faculty.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Faculty Master</h5>
              
          <a href="#" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="#" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
          </div>    
                <div class="col-md-4">
      <div class="card" style="width: 18rem;">
        <img src="icons/load.png" style="padding-top: 20px;padding-left: 70px;" class="card-img-top" alt="..."/>
        <div class="card-body">
          <h5 class="card-title" style="text-align: center;">Load DIstribution</h5>
              
          <a href="#" class="btn btn-light" style="margin-right: 10px;"><i class="fas fa-plus"></i> Add</a>
          <a href="#" class="btn btn-light "><i class="fa fa-eye"></i> View</a>
        </div>
        </div>
        </div> -->

      </div>
        </div>
        <script src="js/sidenav.js"></script>
</body>
</html>