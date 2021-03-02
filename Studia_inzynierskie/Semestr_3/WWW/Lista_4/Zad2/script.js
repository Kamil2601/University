function check_account() {
    info = document.getElementById("account_info");
    var pesel_reg = new RegExp("[0-9]{26}");
    var pesel = document.getElementById("account").value;
    var pesel_test = pesel_reg.test(pesel);
    if (pesel_test == false) {
        info.innerHTML = "Nieprawidłowy numer konta";
        info.style.color = "red";
    }
    else {
        info.innerHTML = "OK";
        info.style.color = "green";
    }
}

function test(year, month, day) {
    today = new Date();
    if (year < 1850 || month < 1 || month > 12 || day < 1 || day > 31)
        return false;
    else if (year > today.getFullYear() || year == today.getFullYear() && month > today.getMonth() + 1 || year == today.getFullYear() && month == today.getMonth() + 1 && day > today.getDate())
        return false;
    else if (month in new Array(1, 3, 5, 7, 8, 10, 12) && day>31)
        return false;
    else if (month in new Array(4,6,9,11) && day>30)
        return false;
    else if (day>29)
        return false;
    else return true;
}

function check_pesel() {
    var pesel = document.getElementById("pesel").value;
    var pesel_reg = new RegExp("[0-9]{2}[01-12]{1}[0-3]{1}[0-9]{1}[0-9]{5}");
    info = document.getElementById("pesel_info");
    var year = 1900 + parseInt(pesel.slice(0, 2));
    var month = parseInt(pesel.slice(2, 4));
    var day = parseInt(pesel.slice(4, 6));
    if (pesel_reg.test(pesel) == false || test(year, month, day) == false) {
        info.innerHTML = "Nieprawidłowy pesel"
        info.style.color = "red";
    }
    else {
        info.innerHTML = "OK"
        info.style.color = "green";
    }
}

function check_date() {
    info = document.getElementById("date_info");
    date = document.getElementById("date").value;
    year = parseInt(date.slice(0, 4));
    month = parseInt(date.slice(5, 7));
    day = parseInt(date.slice(8, 10));

    if (test(year, month, day) == false || date=="") {
        info.innerHTML = "Nieprawidłowa data urodzenia"
        info.style.color = "red";
    }
    else {
        info.innerHTML = "OK"
        info.style.color = "green";
    }

}

function check_email() {
    info = document.getElementById("email_info")
    info.innerHTML = ""
    var email_reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    email = document.getElementById("email").value;
    var email_test = email_reg.test(String(email).toLowerCase());
    if (email_test == false) {
        info.innerHTML = "Nieprawidłowy e-mail"
        info.style.color = "red";
    }
    else {
        info.innerHTML = "OK"
        info.style.color = "green";
    }
}

function check_all() {
    check_account();
    check_date();
    check_pesel();
    check_email();
}