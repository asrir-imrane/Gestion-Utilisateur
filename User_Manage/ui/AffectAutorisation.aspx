<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AffectAutorisation.aspx.cs" Inherits="User_Manage.ui.AffectAutorisation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap CSS -->
    <script src="../Assets/scripts/CRUDJavaScript.js"></script>
    <script>
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

    </script>

</head>
<body>
    <div id="addAutorisationModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="addAutorisationForm" runat="server">
                    <div class="modal-header">
                        <h2 class="modal-title">Affecter une Autorisation</h2>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label for="_Utilisateur" class="form-label">ID d'utilisateur </label>
                            <asp:DropDownList ID="_Utilisateur" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner un utilisateur.</div>
                        </div>


                        <div class="form-group">
                            <label for="Autorisations" class="form-label">Autorisations </label>
                            <asp:DropDownList ID="_Autorisations" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner une autorisation.</div>
                        </div>

                        <div class="form-group">
                            <label for="Applications" class="form-label">Applications </label>
                            <asp:DropDownList ID="_Applications" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner une application.</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAjouter" runat="server" Text="Affecter l'autorisation" CssClass="btn btn-success" OnClick="AffecterAutorisation" />
                        <asp:Button runat="server" Text="Annuler" CssClass="btn btn-secondary" data-dismiss="modal" />
                    </div>

                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorMessage" runat="server" style="display: none;">
                        L'utilisateur n'existe pas.
   
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <% Server.Transfer("DeleteUser.aspx"); %>
</body>
</html>
