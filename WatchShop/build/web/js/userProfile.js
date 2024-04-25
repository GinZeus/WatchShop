/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// xoa dau tren chu cai
function removeAscent(str) {
    if (str === null || str === undefined)
        return str;
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/,/g, "");
    return str;
}

function validateUserProfile() {
    var phoneNumber = document.forms["userProfile"]["phoneNumber"].value;
    var fullName = document.forms["userProfile"]["fullName"].value;
    fullName = removeAscent(fullName);
    var address = document.forms["userProfile"]["address"].value;
    address = removeAscent(address);

    var phoneRegex = /^(09|03|07|08|05)+([0-9]{8})$/;
    var letterRegex = /^[a-zA-Z ]{6,25}$/;
    var addressRegex = /^[a-zA-Z0-9 ]{3,30}$/;

    if (letterRegex.test(fullName) && phoneRegex.test(phoneNumber) && addressRegex.test(address)) {
        if (confirm("Do you want to change profile ?")) {
            setTimeout(document.getElementById("userProfile").submit(), 10000);
        } else {
            document.querySelector("#userProfileMessage").innerHTML = "";
            event.preventDefault();
        }
    } else {
        event.preventDefault();
        if (!letterRegex.test(fullName)) {
            document.querySelector("#fullNameMessage").innerHTML = "Full name must contain only letter and length must be  from 6 to 25";
            document.querySelector("#fullNameMessage").style.color = "red";
        } else {
            document.querySelector("#fullNameMessage").innerHTML = "";
        }

        if (!phoneRegex.test(phoneNumber)) {
            document.querySelector("#phoneMessage").innerHTML = "Phone number is not valid, must be (+84) format";
            document.querySelector("#phoneMessage").style.color = "red";
        } else {
            document.querySelector("#phoneMessage").innerHTML = "";
        }

        if (!addressRegex.test(address)) {
            document.querySelector("#addressMessage").innerHTML = "Address is invalid, length must be from 6 to 30";
            document.querySelector("#addressMessage").style.color = "red";
        } else {
            document.querySelector("#addressMessage").innerHTML = "";
        }
    }
}