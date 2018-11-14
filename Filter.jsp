<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
   <style>

	#results {
	    color: red;
	    margin-left: 40px;
	} 
	</style>
  
    <title>Home</title>
    <meta charset="utf-8" />
  </head>
  <body>
  
   <div id = "results"></div>
	
   <script>
	   
	    var gender = "Male";
	    var age1 = 20;
	    var age2 = "Age...";
	    var idealDate = "Choose...";
	    var yr ="5";
	    var major = "Choose...";
	    var req = "Filter?";
	    req += "&gender="+ gender;
	    req += "&age1="+ age1;
	    req +=  "&age2="+age2;
	    req += "&major="+ major;
	    req += "&yr="+ yr;
	    req += "&idealDate="+ idealDate;
	    var xhttp = new XMLHttpRequest();
	 	xhttp.open("POST", req, false);
	 	xhttp.send(); 
	 	document.getElementById("results").innerHTML = xhttp.responseText;
  
    </script>
    
  </body>
</html>

