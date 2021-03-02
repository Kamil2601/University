var count = 1;


function add_user() {
    var name = $("#name");
    var surname = $("#surname");
    var city = $("#city");
    var code = $("#code");
    var date = $("#date");
    $("#users tbody").append('<tr id="' + count + '">' +
        "<td>" + name.val() + "</td>" +
        "<td>" + surname.val() + "</td>" +
        "<td>" + city.val() + "</td>" +
        "<td>" + code.val() + "</td>" +
        "<td>" + date.val() + "</td>" +
        '<td> <button id="' + count + '" onclick="delete_user(' + count + ')">X</td>' +
        "</tr>");
    count++
}

function delete_user(id) {
    dialog2 = $("#dialog-confirm").dialog({
        resizable: false,
        autoOpen: false,
        height: "auto",
        width: 200,
        modal: true,
        buttons: {
            "Tak": function () {
                $("#" + id).remove();
                $(this).dialog("close");
            },
            "Nie": function () {
                $(this).dialog("close");
            }
        }
    });
    dialog2.dialog("open");
}

/*function open_dialog(){
    dialog.dialog("open");
}*/

function reset() {
    $('input[name=name]').val('');
    $('input[name=surname]').val('');
    $('input[name=city]').val('');
    $('input[name=code]').val('');
    $('input[name=date]').val('');
}

$(document).ready(function () {
    $("#date").datepicker({
        inline: true,
        showOtherMonths: true,
        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    });

    $("#add_person").button().on("click", function () {
        dialog1.dialog("open");
    });

    dialog1 = $("#dialog-form").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            "Dodaj osobę": add_user,
            "Anuluj": function () {
                reset();
                dialog1.dialog("close");
            }

        }
    });

    $("#dialog-confirm").dialog({
        resizable: false,
        autoOpen: false,
        height: "auto",
        width: 400,
        modal: true,
    });


});