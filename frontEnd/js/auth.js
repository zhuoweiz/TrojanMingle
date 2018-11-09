

function signup() {
	var fname = $('#_fullnameID').val();
	var email = $('#_emailID').val();
	var hashedpw = $('#_pwID').val();
	var major = $('#_majorID').val();
	var year = $('#_yearID').val();
	var age = $('#_ageID').val();
	var gender = $('#_genderID').val();
	var bio = $('#_bioID').val();
	//TODO change

	var idealDate = "Movie";

	var serve = "/Signup";
	var requeststr = "/Signup?";
	requeststr += "fullname="+ fullname;
	requeststr += "&hashedpw=" + hashedpw;
	// requeststr += "&picLink="+ picLink;
	requeststr += "&email="+ email;
	requeststr += "&major=" + major;
	requeststr += "&age=" + age;
	requeststr += "&gender=" + gender;
	requeststr += "&yr=" + year;
	requeststr += "&idealDate=" + idealDate;
	requeststr += "&bio=" + bio;

	var xhttp = new XMLHttpRequest();
	xhttp.open("POST", , true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(requeststr);

	signin();
}


function signin() {
	var email = $('#_signinEmailID').val();

	var requeststr = "/Signin?" + "emaial=" + email + "&pw=" + pw;

	var signinxhttp = new XMLHttpRequest();
	signinxhttp.open("POST", , true);
	signinxhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	signinxhttp.send(requeststr

	sessionStorage.setItem('email', email);
}

// // Save data to sessionStorage
// sessionStorage.setItem('key', 'value');

// // Get saved data from sessionStorage
// var data = sessionStorage.getItem('key');

// // Remove saved data from sessionStorage
// sessionStorage.removeItem('key');

// // Remove all saved data from sessionStorage
// sessionStorage.clear();

function signout() {
	sessionStorage.removeItem('email');
}