var fname = $('#_fullnameID').val();
var email = $('#_emailID').val();
var hashedpw = $('#_pwID').val();
var major = $('#_majorID').val();
var year = $('#_yearID').val();
var age = $('#_ageID').val();
var gender = $('#_genderID').val();
var bio = $('#_bioID').val();
//TODO change
if()
var idealDate = "Movie";

var serve = "/Signup";
var requeststr = "";
requeststr += "fullname="+ fullname;
requeststr += "&hashedpw=" + hashedpw;
// requeststr += "&picLink="+ picLink;
requeststr += "&email="+ email;
requeststr += "&major=" + major;
requeststr += "&age=" + age;
requeststr += "&gender=" + gender;
requeststr += "&year=" + year;
requeststr += "&idealDate=" + idealDate;
requeststr += "&bio=" + bio;

var xhttp = new XMLHttpRequest();
xhttp.open("POST", serve, true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send(requeststr);