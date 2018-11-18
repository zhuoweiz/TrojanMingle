<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.User"
    import="user.Message" import="user.Chat" %>


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


	<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="css/swipe.css">
	<link rel="stylesheet" type="text/css" href="css/chat.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light mainNavBar"  style="padding: 0px 0.5rem;">
	  <!-- <a class="navbar-brand" href="#">Trojan Mingle</a> -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#" style="color: gold;">Home <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	    <!-- <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: darkgrey; margin-top: 5px; margin-bottom: 5px;" href="">Browse as a guest</a>
    	</span> -->
	    <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white; margin-top: 5px; margin-bottom: 5px;" href="">Logged in as XXX</a>
    	</span>
	    <!-- <span class="nav-item">
        	<a class="nav-link" style="padding-left: 0px; color: white;" href="">Signup</a>
    	</span> -->
	  </div>
	</nav>
		<h1 style="line-height: 80px;">Chat Page</h1>


	<div id="_chatMainBox">
		<div class="container">
		<div class="messaging">
		      <div class="inbox_msg">
		        <div class="inbox_people">
		          <div class="headind_srch">
		            <div class="recent_heading">
		              <h4>Recent</h4>
		            </div>
		            <div class="srch_bar">
		              <div class="stylish-input-group">
		                <span class="input-group-addon">
		                
		                </span> </div>
		            </div>
		          </div>
		          <div class="inbox_chat">
		            <div class="chat_list active_chat">
		              <div class="chat_people">
		                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		                <div class="chat_ib">
		                  <h5>Tommy Trojan <span class="chat_date">Dec 25</span></h5>
		                  <p>Test, which is a new approach to have all solutions 
		                    astrology under one roof.</p>
		                </div>
		              </div>
		            </div>
		            
		            
		            <div class="chat_list">
		              <div class="chat_people">
		                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		                <div class="chat_ib">
		                  <h5>Tommy Trojan Jr.<span class="chat_date">Dec 25</span></h5>
		                  <p>haha.</p>
		                </div>
		              </div>
		            </div>
		            <div class="chat_list">
		              <div class="chat_people">
		                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		                <div class="chat_ib">
		                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
		                  <p>Nice to meet you.</p>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="mesgs">
		          <div class="msg_history"> <!-- here contains all messages from one chat -->
		            
		            <%
		            	//put stuff here
		            %>
		            
		            <div class="incoming_msg">
		              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		              <div class="received_msg">
		                <div class="received_withd_msg">
		                  <p>Test which is a new approach to have all
		                    solutions</p>
		                  <span class="time_date"> 11:01 AM | June 9</span></div>
		              </div>
		            </div>
		            <div class="outgoing_msg">
		              <div class="sent_msg">
		                <p>Test which is a new approach to have all
		                  solutions</p>
		                <span class="time_date"> 11:01 AM | June 9</span> </div>
		            </div>
		            <div class="incoming_msg">
		              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		              <div class="received_msg">
		                <div class="received_withd_msg">
		                  <p>Test, which is a new approach to have</p>
		                  <span class="time_date"> 11:01 AM | Yesterday</span></div>
		              </div>
		            </div>
		            <div class="outgoing_msg">
		              <div class="sent_msg">
		                <p>USC Los Angeles</p>
		                <span class="time_date"> 11:01 AM | Today</span> </div>
		            </div>
		            <div class="incoming_msg">
		              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		              <div class="received_msg">
		                <div class="received_withd_msg">
		                  <p>Computer Science is fun.</p>
		                  <span class="time_date"> 11:01 AM | Today</span></div>
		              </div>
		            </div>
		          </div>
		          <div class="type_msg">
		            <div class="input_msg_write">
		              <input type="text" class="write_msg" placeholder="Type a message" />
		              <!-- add onclick here to send mesasge to servlet -->
		              <button class="msg_send_btn" type="button">Send</button>
		            </div>
		          </div>
		        </div>
		      </div>
			</div>
		</div>
	</div>


	<hr>
	<div class="footer" style="font-family: Arial">
		<p>Copyright � 2018 Trojan Mingle Inc. All rights reserved.</p>
	</div>
	
</body>
</html>