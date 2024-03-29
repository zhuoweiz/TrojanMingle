<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String failMessage = (String)request.getAttribute("fail");
	if(failMessage==null) {
		failMessage = "";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<title>
		Trojan Mingles
	</title>

	<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-grid.min.css"> -->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<!-- FIREBASE -->

	<script src="https://www.gstatic.com/firebasejs/5.5.8/firebase.js"></script>
	<script>
	  // Initialize Firebase
	  var config = {
	    apiKey: "AIzaSyAQf9xoaJ1hdtwDqWMxX4__0rLqJexBvYg",
	    authDomain: "cs201-1389b.firebaseapp.com",
	    databaseURL: "https://cs201-1389b.firebaseio.com",
	    projectId: "cs201-1389b",
	    storageBucket: "cs201-1389b.appspot.com",
	    messagingSenderId: "396549121459"
	  };
	  firebase.initializeApp(config);
	</script>

	<!-- CUSTOM JS -->

	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/signup.css">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light mainNavBar" style="padding: 0px 0.5rem;">
	  <!-- <a class="navbar-brand" href="#">Trojan Mingle</a> -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#" style="color: gold;">Home <span class="sr-only">(current)</span></a>
	      </li>

	    </ul>
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" href="DisplayUserServlet?guest=true">Browse as a guest</a>
    	</span>
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white;" href="Signin.jsp">Login</a>
    	</span>

	  </div>
	</nav>

	<h1>Sign up for Trojan Mingle!</h1>
	<div id="_signupBox">
		<form class="needs-validation" action="SignUp" method="POST" onsubmit="" novalidate>
		  <div class="form-row">
		    <div class="col-md-3 mb-3">
		      <label for="validationCustom01">Full name</label>
		      <input type="text" name="fullname" class="form-control" id="validationCustom01 _fullnameID" placeholder="First name" value="" required>
		      <div class="valid-feedback">
		        Looks good!
		      </div>
		    </div>

		    <div class="col-md-3 mb-3">
		      <label for="validationCustomUsername">USC Email</label>
		      <div class="input-group">
		        
		        <input type="text" name="email" class="form-control" id="validationCustomUsername _emailID" placeholder="Username" aria-describedby="inputGroupPrepend" required>
		        <div class="input-group-append">
		            <span class="input-group-text" id="basic-addon2">@usc.edu</span>
		          </div>
		        <div class="invalid-feedback">
		          Please choose a username.
		        </div>
		      </div>
		    </div>

		    <div class="col-md-3 mb-3">
		      <label for="validationCustom02">Password</label>
		      <input type="password" name="hashedpw" class="form-control" id="validationCustom02 _pwID" placeholder="Last name" value="" required>
		      <div class="valid-feedback">
		        Looks good!
		      </div>
		    </div>

		    <div class="col-md-3 mb-3">
		      <label for="validationCustom02">Standing</label>
  		      <select class="custom-select" name="standing" id="standingID" required>
  		      	<option value="0">choose...</option>
		  	    <option value="graudate">graudate</option>
		  	    <option value="undergrade">undergrade</option>
		  	  </select>
		    </div>
		    
		  </div>
		  <div class="form-row">

		    <div class="col-md-3 mb-3">
		      <label for="validationCustom03">Year</label>
		      <select class="custom-select" name="yr" id="inputGroupSelect01 _yearID" required>
  		  	    <option value="0" selected>Choose...</option>
  		  	    <option value="1">1</option>
  		  	    <option value="2">2</option>
  		  	    <option value="3">3</option>
  		  	    <option value="4">4</option>
  		  	    <option value="5">5</option>
  		  	    <option value="6">6 and beyond</option>
  		  	  </select>
		    </div>
		    <div class="col-md-3 mb-3">
		      <label for="validationCustom04">Age</label>
		      <input type="number" class="form-control" name="age" id="validationCustom04 _ageID" placeholder="Age.." required>
		      <div class="invalid-feedback">
		        Please provide a valid state.
		      </div>
		    </div>
		    <div class="col-md-3 mb-3">
		      <label for="validationCustom05">Major</label>
		      <select class="custom-select" name="major" id="inputGroupSelect01 _majorID" required>
			    <option selected>Choose...</option>
			    <option value="Computer Science">Computer Science</option>
			    <option value="Business Administration">Business Administration</option>
			    <option value="Double">Double</option>
			  </select>
		    </div>

	        <div class="col-md-3 mb-3">
	          <label for="validationCustom05">Gender</label>
	          <select class="custom-select" name="gender" id="inputGroupSelect01 _genderID" required>
	            <option selected>Choose...</option>
	            <option value="Male">Male</option>
	            <option value="Female">Female</option>
	            <option value="Other">Other</option>
	          </select>
	        </div>

		  </div>
		  	<label for="validationDefaultUsername">Idea date</label>
	  		  <div class="form-row" style="">

	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox1" value="movie" name="idealDate">
	  		  	  <label class="form-check-label" for="inlineCheckbox1">Movie</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox2" value="coffee" name="idealDate">
	  		  	  <label class="form-check-label" for="inlineCheckbox2">Coffee</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox3" value="breakfast" name="idealDate" >
	  		  	  <label class="form-check-label" for="inlineCheckbox3">Breakfast</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox4" value="lunch" name="idealDate" >
	  		  	  <label class="form-check-label" for="inlineCheckbox4">Lunch</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox5" value="dinner" name="idealDate" >
	  		  	  <label class="form-check-label" for="inlineCheckbox5">Dinner</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox6" value="concert" name="idealDate">
	  		  	  <label class="form-check-label" for="inlineCheckbox6">Concert</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox7" value="sport" name="idealDate">
	  		  	  <label class="form-check-label" for="inlineCheckbox7">Sport</label>
	  		  	</div>
	  		  	<div class="form-check form-check-inline">
	  		  	  <input class="form-check-input" type="radio" id="inlineCheckbox8" value="game" name="idealDate">
	  		  	  <label class="form-check-label" for="inlineCheckbox8">Game</label>
	  		  	</div>

	  		  </div>
	  		  <br>

	  		  	<div class="input-group">
	  		  	  <div class="input-group-prepend">
	  		  	    <span class="input-group-text">About me</span>
	  		  	  </div>
	  		  	  <textarea class="form-control" name="bio" aria-label="With textarea"></textarea>
	  		  	</div>

	  		  	<br>

	  	    <div class="form-group">
	      	    <label for="_uploadAnImage">A shining photo of you (<span style="color: orangered;">strongly recommended</span>)</label>
	      	    <input type="hidden" id="avatar_url" name="imgurl" value="/images/default.png">
	      	    <input type="file" accept="image/*" class="form-control-file" id="_uploadAnImage" value=""><span class="_note">(only image files accepted)</span>
	      	    <button type="button" onclick="photoUpload()">upload</button>
	      	    <span id="_uploadStatus" style="font-family: arial; color: red"></span>
	      	  </div>

		  
		  <div class="form-group">
		    <div class="form-check">
		      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
		      <label class="form-check-label" for="invalidCheck">
		        Agree to terms and conditions
		      </label>
		      <div class="invalid-feedback">
		        You must agree before submitting.
		      </div>
		    </div>
		  </div>
		  <a style="color: red;"><%= failMessage %></a>
		  <button class="btn btn-primary" type="submit">Submit form</button>
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
	
	<hr>
	<div class="footer" style="font-family: Arial">
		<p>Copyright © 2018 Trojan Mingle Inc. All rights reserved.</p>
	</div>

	<script type="text/javascript" src="js/auth.js"></script>
</body>
</html>