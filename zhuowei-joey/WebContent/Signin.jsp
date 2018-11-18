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

  <link rel="stylesheet" type="text/css" href="css/home.css">
  <!-- <link rel="stylesheet" type="text/css" href="css/signup.css"> -->
  <link rel="stylesheet" type="text/css" href="css/signin.css">

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
          <a class="nav-link" href="Home.jsp" style="color: gold;">Home <span class="sr-only">(current)</span></a>
        </li>
        
        <!-- <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Dropdown
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li> -->
        <!-- <li class="nav-item" style="float: right;">
          <a class="nav-link" style="color: white;" href="#">Signup</a>
        </li> -->
        <!-- <li class="nav-item" style="float: right;">
          <a class="nav-link" style="color: white;" href="#">Login</a>
        </li> -->

        <!-- <div style="clear: both;"></div> -->
      </ul>
      <span class="nav-item">
          <a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" href="DisplayUserServlet?guest=true">Browse as a guest</a>
      </span>
      <span class="nav-item">
          <a class="nav-link" style="padding-left: 0px; color: white;" href="Signup.jsp">Signup</a>
      </span>
      
<!--      <a class="nav-link" href="#" style="color: gold;">Browse as a guest</a>
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

  <h1>Sign in!</h1>
  <div id="_signinBox">
    <form class="needs-validation" action="SignIn" method="POST" novalidate>
        <div class="mb-3">
          <label for="validationCustomUsername">USC Email</label>
          <div class="input-group">
            
            <input type="text" class="form-control" name="userName" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" required>
            <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2 _signinEmailID">@usc.com</span>
              </div>
            <div class="invalid-feedback">
              Please input your USC username.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="validationCustomUsername">Password</label>
          <div class="input-group">
         
            <input type="password" class="form-control" name="pw" id="validationCustomUsername _signinPwID" placeholder="Password" aria-describedby="inputGroupPrepend" required>
            <div class="invalid-feedback">
              Please set your password.
            </div>
          </div>
        </div>
        
        <a style="color: red;"><%= failMessage %></a>
      
      <button class="btn btn-primary" type="submit">Fight On!</button>
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
</body>
</html>