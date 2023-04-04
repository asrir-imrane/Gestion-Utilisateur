<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="User_Manage.ui.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Assets/css/CRUDStyleSheet.css" />

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label for="utilisateurID" class="form-label">ID d'utilisateur :</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="utilisateurID" name="utilisateurID" readonly="readonly" value="" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="Roles" class="form-label">Rôles :</label>
                                <asp:DropDownList ID="_Roles" runat="server" CssClass="form-control" required="required" />
                                <div class="invalid-feedback">Veuillez sélectionner un rôle.</div>
                            </div>

                            <div class="mb-3">
                                <label for="Autorisations" class="form-label">Autorisations :</label>
                                <asp:DropDownList ID="_Autorisations" runat="server" CssClass="form-control" required="required" />
                                <div class="invalid-feedback">Veuillez sélectionner une autorisation.</div>
                            </div>

                            <div class="mb-3">
                                <label for="Applications" class="form-label">Applications :</label>
                                <asp:DropDownList ID="_Applications" runat="server" CssClass="form-control" required="required" />
                                <div class="invalid-feedback">Veuillez sélectionner une application.</div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnModifier" runat="server" Text="Modifier l'utilisateur" CssClass="btn btn-warning" OnClick="ModifierUtilisateur" />
                            <asp:Button runat="server" Text="Annuler" CssClass="btn btn-secondary" data-dismiss="modal" OnClick="Annuler_Click" />
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
