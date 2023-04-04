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






$(".delete-user").click(function (event) {
    event.preventDefault();
    var userId = $(this).data("userid");
    var userName = $(this).data("username");
    var modalHtml = `
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Êtes-vous sûr de vouloir supprimer l'utilisateur <strong>${userName}</strong>?</p>
                    </div>
                   <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-danger" id="deleteBtn">Supprimer</button>
                    </div>

                </div>
            </div>
        </div>
    `;
    $("body").append(modalHtml);
    $("#deleteModal").modal("show");

    $("#deleteBtn").click(function () {

        $.ajax({
            type: "POST",
            url: "DeleteUser.aspx/Supprimerutilisateur",
            data: '{userId: ' + userId + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $("#deleteModal").modal("hide");
                $(".alert-message").html(response);
                location.reload();
            },
            error: function (response) {
                console.log("%cErreur lors de la suppression de l'utilisateur.", "color: white; background-color: red; padding: 5px;");
            }
        });
    });
});


