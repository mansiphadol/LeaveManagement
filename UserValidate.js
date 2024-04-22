           function validate() {
            var user=document.userform.username.value; //username is name attribute of input tag
            var pass=document.userform.password.value;
            var desi=document.userform.Designation.value;
            if(user === "") {
                document.getElementById("user_err").innerHTML = "**Username cannot be empty";
                return false;
            } else {
                document.getElementById('user_err').innerHTML = "";
            }
            if(pass === "") {
                document.getElementById("pass_err").innerHTML = "**Password cannot be empty";
                return false;
            } else {
                 document.getElementById("pass_err").innerHTML = "";
            }
            if(desi === "") {
               document.getElementById("designation_err").innerHTML = "**Choose Designation";
               return false;
           } else {
                 document.getElementById("designation_err").innerHTML = "";
           }
        }  