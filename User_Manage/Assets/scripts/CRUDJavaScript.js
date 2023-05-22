$(document).ready(function () {
    // Activate tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // Filter table rows based on searched term
    $("input[type='search']").on("keyup", function () {
        var term = $(this).val().toLowerCase();
        $("table tbody tr").each(function () {
            var found = false;
            $(this).find("td").each(function () {
                if ($(this).text().toLowerCase().indexOf(term) > -1) {
                    found = true;
                    return false;
                }
            });
            if (found) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

});



$(function () {
    $('[data-dismiss="modal"]').click(function () {
        $('.modal').modal('hide');
    });
});

$(".edit-user").click(function (e) {
    e.preventDefault();

    var userId = $(this).data('userid');
    $('#utilisateurID').val(userId);
    if ($(this).hasClass("edit-user")) {
        $("#editEmployeeModal").modal("show");
    }
});

$(".add-autorisation").click(function (e) {
    e.preventDefault();

    var userId = $(this).data('userid');
    var Role = $(this).data('role');
    $('#utilisateurID').val(userId);
    $('#Roles').val(Role);

    if ($(this).hasClass("add-autorisation")) {
        $("#addAutorisationModal").modal("show");
    }
});



$(".delete-user").click(function (e) {
    e.preventDefault();
    var UserId = $(this).data("userid");
    var UserName = $(this).data("username");
    $('#nom_User').val(UserName);
    $('#id_User').val(UserId);
    if ($(this).hasClass("delete-user")) {
        $("#deleteModal").modal("show");
    }
});




