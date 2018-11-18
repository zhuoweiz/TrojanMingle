<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.User"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>
		TM Swipe
	</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>	

	<!-- zhuowei edit -->
	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/guest.css">
	<link rel="stylesheet" type="text/css" href="css/swipe.css">
		
	<!-- zhuowei edit -->
	<script type="text/javascript" src="js/auth.js"></script>
</head>
<body>
	<!-- start Teagan's code -->

	<%
		
		//browse page expects a guest boolean, userID int, users ArrayList
	
		int count = 1; //variable to keep track of which user we're on
		
		int userID = -1; //set userID to -1 to indicate guest status
		
		boolean guest = (boolean)request.getAttribute("guest");
		
		//assuming userID passed in from other servlet call redirecting to browse page
		//if user is NOT a guest, but logged in, change the userID to the actual userID
		if(!guest) { 
			userID = (int)request.getAttribute("userID");
		}
		
		//assuming parameter called "users" is an ArrayList of User objects passed from servlet	
		ArrayList<User> users = (ArrayList<User>)request.getAttribute("users"); //new ArrayList<User>(); //(ArrayList<User>)request.getAttribute("users");//
		/* users.add(new User(1, "Jeff", "jeff.jpg", "I am a CS teacher and proud father of soccer stars", "Computer Science", "Graduate", "Male", 
			"coffee", 40, 3));
		users.add(new User(2, "Michael", "michael.jpg", "I am a CS teacher and love algorithms", "Computer Science", "Undergraduate", "Male", 
				"dinner", 35, 2)); 
		users.add(new User(3, "Sandra", "sandra.jpg", "I am a CS teacher and love CS104 and pointers", "Computer Engineering", "Graduate", "female", 
				"sports", 30, 3)); */
		//so apostrophes are going to be an issue, if we want to care about that
		
	%>

	<!-- end Teagan's code -->

	<!-- zhuowei's edit -->
	<script>
	    var userToken = sessionStorage.getItem('userToken');
    	if (userToken === null) {
    		  //...
    		  /* $("#guestBrowseLink").css("display","block"); */
    		  /* $("#signoutLink").css("display","none"); */
    	} else {
    		//signed in
    		/* $("#guestBrowseLink").css("display","none"); */
    		/* $("#loginLink").css("display","none");
    		$("#signupLink").css("display","none"); */
    		/* $("#signoutLink").css("display","block"); */
    	}
    </script>
    <!-- zhuowei's edit -->

	<nav class="navbar navbar-expand-lg navbar-light mainNavBar"  style="padding: 0px 0.5rem;">
	  <!-- <a class="navbar-brand" href="#">Trojan Mingle</a> -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="Home.jsp" style="color: gold;">Home <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	    
	    <script>
		  //for redirect to chat page
			function toChatPage() {
				
				var userID = 1; //document.getElementById("userID").value;
				console.log("userID: "+userID);
				/*
				var xhttp = new XMLHttpRequest();
				xhttp.open("POST", "ChatServlet", true);
				xhttp.onreadystatechange = function() {
					
					//callback function
				} 
				
				xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhttp.send("userID="+userID); */
				
				var xhttp = new XMLHttpRequest();	
				xhttp.open("GET", "ChatServlet?userID="+userID, true);
				
				//calls onreadystatechange more than once
				xhttp.onreadystatechange = function() {
					
				} 
				
				xhttp.send();
			}
	    </script>
	    
	    <% if(!(boolean)request.getAttribute("guest")) { %>
		    <span class="nav-item" id="chatLink">
	        	<a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" href="ChatServlet?userID=<%= userID %>">Chat</a> <%-- <%= userID %> --%>
	    	</span>
    	
    		<!-- zhuowei's edit -->
		    <span class="nav-item" id="signoutLink">
	        	<a class="nav-link" style="padding-left: 0px; color: white; margin-top: 5px; margin-bottom: 5px;" onclick="signout();" href="Home.jsp">Sign Out</a>
	    	</span>
	    	
    	<% } else { %>
    		<span class="nav-item" id="signupLink">
	        	<a class="nav-link" style="padding-left: 0px; color: white;" href="Signup.jsp">Signup</a>
	    	</span>
	    	<span class="nav-item" id="signinLink">
	        	<a class="nav-link" style="padding-left: 0px; color: white;" href="Signin.jsp">Signin</a>
	    	</span>
    	<% }%>
    	<!-- end zhuowei's edit -->
	  </div>
	</nav>
		<h1 style="line-height: 80px;">Browse</h1>

		<!-- ONLY SHOW FILTERING IF USER IS NOT A GUEST -->
		<% if(!guest) { %>
		<div id="_searchbarControlBox">
			<a class="btn btn-primary" data-toggle="collapse" href="#_searchFilterBox" role="button" aria-expanded="false" aria-controls="_searchFilterBox" style="width: 100%;">
			    Search Filter
			  </a>
		</div>
		<% } %>

		<div class="_complexBox">
			<div class="collapse" id="_searchFilterBox">

				<form id="filterform" class="needs-validation form-inline" novalidate method="GET" action="Filter">
						
						<!-- /* String age1 = request.getParameter("age1");
							String age2 = request.getParameter("age2");
							String gender = request.getParameter("gender");
							String major = request.getParameter("major");
							String idealDate = request.getParameter("idealDate");
						    String yr = request.getParameter("yr"); */ -->
						
						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Gender</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" name="gender" required>
						    <option selected>Choose...</option>
						    <option value="Male">Male</option>
						    <option value="Female">Female</option>
						    <option value="Other">Other</option>
						  </select>
						</div>

						<div class="input-group mb-3" style="">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01"> From</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" name="age1" style="margin-right: 10px;">
						    <option selected>Age..</option>
						    <option value="17">< 18</option>
						    <option value="18">18</option>
						    <option value="19">19</option>
						    <option value="20">20</option>
						    <option value="21">21</option>
						    <option value="22">22</option>
						    <option value="23">23</option>
						    <option value="24">24</option>
						    <option value="25">25</option>
						    <option value="26">26</option>
						    <option value="27">27</option>
						    <option value="28">28</option>
						    <option value="29">29</option>
						    <option value="30">30</option>
						    <option value="31">> 30</option>
						  </select>

						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01"> To</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" name="age2">
						    <option selected>Age..</option>
						    <option value="17">< 18</option>
						    <option value="18">18</option>
						    <option value="19">19</option>
						    <option value="20">20</option>
						    <option value="21">21</option>
						    <option value="22">22</option>
						    <option value="23">23</option>
						    <option value="24">24</option>
						    <option value="25">25</option>
						    <option value="26">26</option>
						    <option value="27">27</option>
						    <option value="28">28</option>
						    <option value="29">29</option>
						    <option value="30">30</option>
						    <option value="31">> 30</option>
						  </select>
						</div>

						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Major</label>
						  </div>

						  <!-- PROBABLY MAKE THIS INTO A TEXT FIELD -->
						  <select class="custom-select" id="inputGroupSelect01" name="major" required>
						    <option selected>Choose...</option>
						    <option value="Computer Science">Computer Science</option>
						    <option value="Business Administration">Business Administration</option>
						    <option value="3">Double</option>
						  </select>
						</div>

						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Year</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" name="yr" required>
						    <option selected>Choose...</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						    <option value="6">6</option>
						    <option value="7">7</option>
						    <!-- <option value="8">Doctor and beyond</option> -->
						  </select>
						</div>

						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Ideal date</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" name="idealDate" required>
						    <option selected>Choose...</option>
						    <option value="Movie">Movie</option>
						    <option value="Hiking">Hiking</option>
						    <option value="Picnic">Picnic</option>
						    <option value="Coffee">Coffee</option>
						    <option value="Breakfast">Breakfast</option>
						    <option value="Lunch">Lunch</option>
						    <option value="Dinner">Dinner</option>
						    <option value="Concert">Concert</option>
						    <option value="Sport">Sport</option>
						    <option value="Game">Game</option>

						  </select>
						</div>
						
						<input type="hidden" name="userID" value="<%= userID %>">


				  <button class="btn btn-primary" type="submit" value="submit" style="margin-left: auto; margin-right: auto; text-align: center;">Search</button>
				</form>

				<script>
				// Example starter JavaScript for disabling form submissions if there are invalid fields
				/* (function() {
				  'use strict';
				  window.addEventListener('load', function() {
				    // Fetch all the forms we want to apply custom Bootstrap validation styles to
				    var forms = document.getElementsByClassName('needs-validation');
				    // Loop over them and prevent submission
				    var validation = Array.prototype.filter.call(forms, function(form) {
				      form.addEventListener('submit', function(event) {
				        if (form.checkValidity() === false) {
				          event.preventDefault();
				          event.stopPropagation();
				        }
				        form.classList.add('was-validated');
				      }, false);
				    });
				  }, false);
				})(); */
				</script>
			</div>


				<div class="cardBox" style="">
					<div class="card" style="width: 18rem; margin: auto;">
						<div class="card-img-box" style="width: 286px; height: 240px; overflow: hidden;">
							<% if(users.size() > 0) { %>
							<img class="card-img-top" id="profilepic" src="<%= users.get(0).getProfilePic() %>">
							<% } %>
						</div>
					  
					  <div class="card-body">
					    <!-- start Teagan's code -->
					    
					    <!--  only display users if there are users matching the criteria -->
					    <% if(users.size() > 0) { %>
						    <p id="profilepic" style="display: none;"><%= users.get(0).getProfilePic() %></p>
							<p id="otherID" style="display: none;"><%= users.get(0).getUserID() %></p>
							<div id="info" style="text-align: center; margin-bottom: 10px;"><%= users.get(0).toString() %></div>
						<% } else { %>
							<p style="color: red; text-align: center;">No results matching criteria</p>
						<% } %>
						<!-- hide all the users in the list in hidden divs -->
						<% for(int i = 1; i < users.size(); i++) { %>
							<div id="<%= i %>" style="display: none;"><%= users.get(i).toString() %></div>
							<div id="<%= i %>id" style="display: none;"><%= users.get(i).getUserID() %></div>
							<div id="<%= i %>pic" style="display: none"><%= users.get(i).getProfilePic() %></div>
						<% } %>
						
						<!-- put current userID in hidden form field; make sure signin servlet passing guest parameter -->
					
							<input type="hidden" id="userID" value="<%= userID %>">
						
						<!-- end Teagan's code -->

					    <a href="#" class="btn btn-light" style="float: left; width: 120px;" onclick="return left();">&#8678; X like</a>
					    <a href="#" class="btn btn-primary" style="float: right; width: 120px;" onclick="return right();">LIKE &#x21E8;</a>
					    <div style="clear: both;"></div>
					  </div>
					</div>
				</div>

		</div>
	

	<hr>
	<div class="footer" style="font-family: Arial">
		<p>Copyright © 2018 Trojan Mingle Inc. All rights reserved.</p>
	</div>
</body>

<!-- start Teagan's JS code -->
<script>
	var count = 1; //variable to keep track of which user we're on
	
	document.onkeydown = checkKey; //when any key is pressed, check it
	
	function changeUserDisplayed() {
		if(count < <%= users.size() %>) { 
			document.getElementById("info").innerHTML = document.getElementById(String(count)).innerHTML;
			document.getElementById("otherID").innerHTML = document.getElementById(String(count)+"id").innerHTML;
			
			//change profile pic
			document.getElementById("profilepic").src = document.getElementById(String(count)+"pic").innerHTML;
			
			console.log("count: "+count+"\nuserID: "+document.getElementById(String(count)+"id").innerHTML);
			
			count++;
		}
		else { 
			document.getElementById("info").innerHTML = "No more users to display";
			document.getElementById("profilepic").src = ""; //empty string for src
		 }
	}
	
	//right arrow key was pressed - send info to match servlet and display new user
	function right() {
		console.log("right arrow key pressed");
		var userID = document.getElementById("userID").value;
		var liked;
		
		if(count > 1) {
			liked = document.getElementById(String(count-1)+"id").innerHTML;
		}
		else { //picking the first user that shows on the browse page, which has a different div name pattern
			liked = document.getElementById("otherID").innerHTML;
		}
		
		console.log("current user: "+userID+"\nliked user: "+liked);
		
		//only execute servlet call if the user is NOT a guest
		if(userID != -1) {
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "MatchServlet", true);
			xhttp.onreadystatechange = function() {
				
				//probably notify the current user here?
				console.log("in callback function");
			} 
			
			xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhttp.send("userID="+userID+"&liked="+liked);
		}
		
		changeUserDisplayed();
	}
	
	//left arrow key was pressed - display new user
	function left() {
		console.log("left arrow key pressed");
		
		changeUserDisplayed();
	}
	
	
	//check if key pressed was a right or left arrow key
	function checkKey(e) {
		 e = e || window.event;
		 
		if (e.keyCode == '37') { //left arrow pressed
		     left();
		}
	    
		else if (e.keyCode == '39') { //right arrow pressed
			right();
	    }
	}
	
	//use the filter form to filter users shown
	function filter() {
		
		//AJAX call to servlet
		//make sure to pass userID as parameter
		
		//in callback function
			document.getElementById("info").innerHTML = xhttp.responseText;
		
	}
	
	
</script>

<!-- end Teagan's JS code -->


</html>