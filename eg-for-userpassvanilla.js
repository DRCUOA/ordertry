// variables
let emailnotinuse = false;
let usernamevalid = false;
let passwordvalid = false;
let repasswordvalid = false;

// this function keeps the submit button diabled until all the check varibless are true

function setSubmitButton() {
    if (emailNotInUse && usernamevalid && passwordValid && repasswordvalid) {
        document.querySelector('#createUserButton').disabled = false;
    } else {
        document.querySelector('#createUserButton').disabled = true;
    }
}

document.querySelector('#email').addEventListener('keyup', function () {
    const email = document.querySelector('#email').value;
    if (email != "") {
        fetch('/email_check?email=' + document.querySelector('#email').value.toLowerCase())
            .then(response => response.json())
            .then(data => {
                if (data.message == "inuse") {
                    emailNotInUse = false;
                    document.querySelector('#emailstatus').innerHTML = "Email already in use with another account!!";
                    setSubmitButton();
                } else {
                    emailNotInUse = true;
                    document.querySelector('#emailstatus').innerHTML = "";
                    setSubmitButton();
                }
            });
    } else {
        emailNotInUse = false;
        document.querySelector('#emailstatus').innerHTML = "Email cannot be empty!!";
        setSubmitButton();
    }
});

document.querySelector('#txtUsername').addEventListener('keyup', function () {
    let username = document.querySelector('#txtUsername').value;
    if (username != "") {
        fetch('/username_check?username=' + document.querySelector('#txtUsername').value.toLowerCase())
            .then(response => response.json())
            .then(data => {
                if (data.message == "taken") {
                    usernamevalid = false;
                    document.querySelector('#usernamestatus').innerHTML = "Username already taken!!";
                    setSubmitButton();
                } else {
                    usernamevalid = true;
                    document.querySelector('#usernamestatus').innerHTML = "Username available!!";
                    setSubmitButton();
                }
            });
    } else {
        usernamevalid = false;
        document.querySelector('#usernamestatus').innerHTML = "Username can not be empty!!!";
        setSubmitButton();
    }
});

document.querySelector('#txtPassword').addEventListener('keyup', function () {
    let password = document.querySelector('#txtPassword').value;
    if (password != "") {
        passwordValid = true;
        document.querySelector('#passwordstatus').innerHTML = '';
        setSubmitButton();
    } else {
        passwordValid = false;
        document.querySelector('#passwordstatus').innerHTML = "Password can not be empty!!!";
        setSubmitButton();
    }
});

document.querySelector('#reenterPassword').addEventListener('keyup', function () {
    let password = document.querySelector('#txtPassword').value;
    let repassword = document.querySelector('#reenterPassword').value;
    if (password != "" && repassword != "" && password == repassword) {
        repasswordvalid = true;
        document.querySelector('#repasswordstatus').innerHTML = '';
        setSubmitButton();
    } else if (repassword == "") {
        repasswordvalid = false;
        document.querySelector('#repasswordstatus').innerHTML = "Password can not be empty!!!";
        setSubmitButton();
    } else if (repassword != password) {
        repasswordvalid = false;
        document.querySelector('#repasswordstatus').innerHTML = "Passwords do not match!!!";
        setSubmitButton();
    }
});