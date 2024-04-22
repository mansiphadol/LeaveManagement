           function validate() {
                var user = document.userform.username.value;
                var newPass = document.userform.newpassword.value;
                
                var len = newPass.length;
                
                if(user === "") {
                    document.getElementById("user_err").innerHTML = "**Username cannot be empty";
                    return false;
                } else {
                    document.getElementById("user_err").innerHTML = "";
                }
                
                if(newPass === "") {
                    document.getElementById("new_err").innerHTML = "**New Password cannot be empty";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }

                if(len < 8) {
                    document.getElementById("new_err").innerHTML = "**Password must have atleast 8 characters";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }
                
                var result = 0;
                var regex = /[a-zA-Z]/;
                if(newPass.match(regex)) {
                    result = 1;
                }
                if(result === 0) {
                    document.getElementById("new_err").innerHTML = "**Password should contain atleast 1 alphabet ";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }
              
                result = 0;
                regex = /[0-9]/;
                if(newPass.match(regex))
                    result = 1;
                
                if(result === 0) {
                    document.getElementById("new_err").innerHTML = "**Password should contain atleast 1 digit";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }
                
                result = 0; 
                regex = "^(?=.*[a-z]).+$";     //regular expression for 1 lowercase 
                if(newPass.match(regex))
                    result = 1;
                
                if(result === 0) {
                    document.getElementById("new_err").innerHTML = "**Password must contain atleast one lowercase character";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }
                
                result = 0; 
                regex = "^(?=.*[A-Z]).+$";
                if(newPass.match(regex))
                    result = 1;
                
                if(result === 0) {
                    document.getElementById("new_err").innerHTML = "**Password must contain atleast one uppercase character";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }

                result = 0;
                regex = "^(?=.*[-+_!@#$%^&.,?]).+$";   
                if(newPass.match(regex)){
                    result = 1;
                }
                
                if(result === 0) {
                    document.getElementById("new_err").innerHTML = "**Password must contain atleast one special character";
                    return false;
                } else {
                    document.getElementById("new_err").innerHTML = "";
                }
           }