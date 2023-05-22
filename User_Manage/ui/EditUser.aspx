<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="User_Manage.ui.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap CSS -->


    <script src="../Assets/scripts/CRUDJavaScript.js"></script>

</head>
<body>
    <div>


        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="editUserForm" runat="server">

                        <div class="modal-header">
                            <h2 class="modal-title">Modifier un utilisateur</h2>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label for="utilisateurID" class="form-label">ID d'utilisateur </label>

                                <input type="text" class="form-control" id="utilisateurID" name="utilisateurID" readonly="readonly" value="" />

                            </div>
                            <div class="form-group">
                                <label for="Roles" class="form-label">Rôles </label>
                                <asp:DropDownList ID="_Roles" runat="server" CssClass="form-control" required="required" />
                                <div class="invalid-feedback">Veuillez sélectionner un rôle.</div>
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

                            <asp:Button ID="btnModifier" runat="server" Text="Modifier l'utilisateur" CssClass="btn btn-success" OnClick="ModifierUtilisateur" />
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
        <!-- Edit Modal HTML -->
        <% Server.Transfer("AffectAutorisation.aspx"); %>
    </div>
</body>
</html>
