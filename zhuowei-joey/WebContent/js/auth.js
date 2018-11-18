
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

//	var xhttp = new XMLHttpRequest();
//	xhttp.open("POST", true);
//	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//	xhttp.send(requeststr);
}


function signin(token) {
	sessionStorage.setItem('userToken', token);
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
	sessionStorage.removeItem('userToken');
}

var previousFilename = "";
function photoUpload() {
	const ref = firebase.storage().ref();

	const file = $('#_uploadAnImage').get(0).files[0];
	if(file==null) {
		$("#_uploadStatus").text("no file to upload")
		console.log("no file chosen....");
	}else {
		$("#_uploadStatus").css("color","green")
		$("#_uploadStatus").text("1 file chosen")

		if(previousFilename!=file.name) {
			previousFilename = file.name
			const name = (+new Date()) + '-' + file.name;

			const metadata = {
			  contentType: file.type
			};
			const task = ref.child(name).put(file, metadata);
			task
			  .then(snapshot => snapshot.ref.getDownloadURL())
			  .then((url) => {
			    console.log(url);
			    document.querySelector('#avatar_url').value = url;
			    $("#_uploadStatus").text("file uploaded")
			  })
			  .catch(console.error);
		}else {
			$("#_uploadStatus").css("color","red")
			$("#_uploadStatus").text("file already uploaded...")
			console.log("file already uploaded...")
		}
	}
}






