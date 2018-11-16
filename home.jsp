<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.User"%>
    
<!DOCTYPE html>
<html>
<head>
	<title>
		Trojan Mingle
	</title>

	<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-grid.min.css"> -->

	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="swipe.css">

</head>
<body>

<script>
	function guestBrowse() {
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "DisplayUserServlet", true);
		xhttp.onreadystatechange = function() {
			
			//callback function
		} 
		
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("guest=true");
	}
</script>

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
        	<a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" href="DisplayUserServlet?guest=true">
        	Browse as a guest
        	</a>
    	</span>
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white;" href="">Login</a>
    	</span>
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white;" href="">Signup</a>
    	</span>

<!-- 	    <a class="nav-link" href="#" style="color: gold;">Browse as a guest</a>
	    <a class="nav-link" href="#" style="color: gold;">Login</a>
	    <a class="nav-link" href="#" style="color: gold;">Signup</a> -->
	    <!-- <a type="" class="btn btn-outline-danger" style="margin: 10px; color: darkgrey;">Browse as a guest</a> -->
	    <!-- <a type="" class="btn btn-outline-warning" style="width: 80px; color: white; margin: 10px;">Signup</a>
	    <a type="" class="btn btn-outline-warning" style="width: 80px; color: white; margin: 10px;">Login</a> -->
	    <!-- <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form> -->
	  </div>
	</nav>

	<div id="header">
		<p style="color: white">TROJAN MINGLE</p>
		<h2 style="text-align: center; color: white">Logo here</h2>
		<div style="width: 205px; margin: auto; padding: 0px;">
			<!-- <button type="button" class="btn btn-outline-danger" style="width: 80px; margin: 10px; background-color: #ffffff8c;">Sign Up</button>
			<button type="button" class="btn btn-outline-warning" style="width: 80px; margin: 10px; background-color: #ffffff8c;">Guest</button> -->
		</div>
	</div>

	<div id="mainIntro">
		<div style="padding-top: 180px; margin-left: 350px; width: 420px;">Find your perfect match at USC</div>
	</div>
	

	<hr>
	<div class="footer" style="font-family: Arial">
		<p>Copyright © 2018 Trojan Mingle Inc. All rights reserved.</p>
	</div>
</body>
</html>