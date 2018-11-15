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

	<link rel="stylesheet" type="text/css" href="swipe.css">
	
	<!-- <link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/guest.css">
	<link rel="stylesheet" type="text/css" href="css/swipe.css"> -->
</head>
<body>
	<!-- start Teagan's code -->

	<%
		int count = 1; //variable to keep track of which user we're on
		
		//assuming userID passed in from other servlet call redirecting to browse page
		int userID = 3; //(int)request.getAttribute("userID");
		
		//assuming parameter called "users" is an ArrayList of User objects passed from servlet	
		ArrayList<User> users = (ArrayList<User>)request.getAttribute("users");//new ArrayList<User>();
		/* users.add(new User(1, "Jeff", "jeff.jpg", "I am a CS teacher and proud father of soccer stars", "Computer Science", "Graduate", "Male", 
			"coffee", 40, 3));
		users.add(new User(2, "Michael", "michael.jpg", "I am a CS teacher and love algorithms", "Computer Science", "Undergraduate", "Male", 
				"dinner", 35, 2)); 
		users.add(new User(3, "Sandra", "sandra.jpg", "I am a CS teacher and love CS104 and pointers", "Computer Engineering", "Graduate", "female", 
				"sports", 30, 3)); */
		//so apostrophes are going to be an issue, if we want to care about that
		
	%>

	<!-- end Teagan's code -->


	<nav class="navbar navbar-expand-lg navbar-light mainNavBar"  style="padding: 0px 0.5rem;">
	  <!-- <a class="navbar-brand" href="#">Trojan Mingle</a> -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="home.jsp" style="color: gold;">Home <span class="sr-only">(current)</span></a>
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
	    
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" onclick="return toChatPage();">Chat</a>
    	</span>
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white; margin-top: 5px; margin-bottom: 5px;" href="">Logged in as XXX</a>
    	</span>
	    <!-- <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white;" href="">Signup</a>
    	</span> -->
	  </div>
	</nav>
		<h1 style="line-height: 80px;">Browse</h1>


		<div id="_searchbarControlBox">
			<a class="btn btn-primary" data-toggle="collapse" href="#_searchFilterBox" role="button" aria-expanded="false" aria-controls="_searchFilterBox" style="width: 100%;">
			    Search Filter
			  </a>
		</div>

		<div class="_complexBox">
			<div class="collapse" id="_searchFilterBox">

				<form class="needs-validation form-inline" novalidate>
						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Gender</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" required>
						    <option selected>Choose...</option>
						    <option value="1">Male</option>
						    <option value="2">Female</option>
						    <option value="3">Other</option>
						  </select>
						</div>

						<div class="input-group mb-3" style="">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01"> From</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" style="margin-right: 10px;">
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
						  <select class="custom-select" id="inputGroupSelect01">
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
						  <select class="custom-select" id="inputGroupSelect01" required>
						    <option selected>Choose...</option>
						    <option value="1">Computer Science</option>
						    <option value="2">Business Administration</option>
						    <option value="3">Double</option>
						  </select>
						</div>

						<div class="input-group mb-3" style="width: 100%">
						  <div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">Year</label>
						  </div>
						  <select class="custom-select" id="inputGroupSelect01" required>
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
						  <select class="custom-select" id="inputGroupSelect01" required>
						    <option selected>Choose...</option>
						    <option value="1">Movie</option>
						    <option value="2">Hiking</option>
						    <option value="3">Picnic</option>
						    <option value="4">Coffee</option>
						    <option value="5">Breakfast</option>
						    <option value="6">Lunch</option>
						    <option value="7">Dinner</option>
						    <option value="8">Concert</option>
						    <option value="9">Sport</option>
						    <option value="10">Game</option>

						  </select>
						</div>


				  <button class="btn btn-primary" type="submit" style="margin-left: auto; margin-right: auto;">Reload the deck</button>
				</form>

				<script>
				// Example starter JavaScript for disabling form submissions if there are invalid fields
				(function() {
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
				})();
				</script>
			</div>


				<div class="cardBox" style="">
					<div class="card" style="width: 18rem; margin: auto;">
						<div class="card-img-box" style="width: 286px; height: 240px; overflow: hidden;">
							<img class="card-img-top" src="https://pressroom.usc.edu/files/2015/01/JeffreyMiller-cropped-1024x999.jpg" alt="Card image cap">
						</div>
					  
					  <div class="card-body">
					    <!-- start Teagan's code -->
					    <!-- hidden for the moment until we figure out how to deal with profile pics -->
					    <p id="profilepic" style="display: none;"><%= users.get(0).getProfilePic() %></p>
						<p id="otherID" style="display: none;"><%= users.get(0).getUserID() %></p>
						<div id="info" style="text-align: center; margin-bottom: 10px;"><%= users.get(0).toString() %></div>
						
						<!-- hide all the users in the list in hidden divs -->
						<% for(int i = 1; i < users.size(); i++) { %>
							<div id="<%= i %>" style="display: none;"><%= users.get(i).toString() %></div>
							<div id="<%= i %>id" style="display: none;"><%= users.get(i).getUserID() %></div>
						<% } %>
						
						<!-- put current userID in hidden form field -->
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
			
			console.log("count: "+count+"\nuserID: "+document.getElementById(String(count)+"id").innerHTML);
			
			count++;
		}
		else { 
			document.getElementById("info").innerHTML = "No more users to display";
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
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "MatchServlet", true);
		xhttp.onreadystatechange = function() {
			
			//probably notify the current user here?
			console.log("in callback function");
		} 
		
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("userID="+userID+"&liked="+liked);
		
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
	
	
</script>

<!-- end Teagan's JS code -->


</html>