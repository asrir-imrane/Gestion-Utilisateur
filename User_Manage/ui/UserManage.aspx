﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManage.aspx.cs" Inherits="User_Manage.ui.UserManage" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>Géstion des Utilisateurs</title>
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet" />

    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" integrity="sha384-dtV5C5+mfIjJ8OvH0d7bzDJwIphlOaEJj/vxHgyV1pG9tX5Wj8oL5d5I7YoDQyCY" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" />

    <link rel="stylesheet" href="../Assets/css/CRUDStyleSheet.css">
    <link rel="stylesheet" href="../Assets/css/StyleSheet.css">
    <link rel="stylesheet" href="../Assets/css/StyleSheetHome.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Add Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="../Assets/scripts/CRUDJavaScript.js"></script>

    <!-- BOX ICONS CSS-->
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">

    <script src="https://unpkg.com/exceljs/dist/exceljs.min.js"></script>
    <script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <scriptr>
        <script>
            AOS.init();
        </script>
    </scriptr>
    <style>
        /* Modal styles */
        .detail {
            margin-left: 600px;
            max-height: 700px;
            overflow-y: scroll;
            font-family: "Dosis", sans-serif;
        }

        .modal-dialog {
            max-width: 700px;
        }


        .modal-body {
            
            max-height: 700px;
           
            font-family: "Dosis", sans-serif;
        }


            .modal-body .form-group {
                display: flex;
                align-items: flex-end;
                justify-content: flex-end;
            }

                .modal-body .form-group label {
                    margin-right: 20px;
                    margin-bottom: 0;
                    position: relative;
                    display: inline-block;
                    width: 300px;
                    text-align: left;
                }

                    .modal-body .form-group label::before {
                        content: ":";
                        position: absolute;
                        right: -10px;
                        top: 50%;
                        transform: translateY(-50%);
                    }

                    .modal-body .form-group label::after {
                        content: "*";
                        color: red;
                        margin-left: 5px;
                    }
        /* Styles for the modal title */

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
            border-radius: 30px 30px 0 0;
        }



        .modal .modal-content {
            border-radius: 30px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
        }

        .modal .modal-footer {
            border-radius: 0 0 30px 30px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .modal .form-control {
            border-radius: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }


        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 12px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }

        /* Styles for the modal header */

        .modal-header {
            background-color: #f8f9fa;
            color: #212529;
            border-bottom: 1px solid #dee2e6;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .bt-title .modal-title {
            margin: 30px;
            font-weight: bold;
            font-size: 34px;
            line-height: 1.5;
            font-family: "Dosis", sans-serif;
        }

        .modal-title {
            margin: 0;
            font-weight: bold;
            font-size: 34px;
            line-height: 1.5;
            font-family: "Dosis", sans-serif;
        }




        .btn-close {
            background-color: transparent;
            border: none;
            outline: none;
            cursor: pointer;
            font-size: 24px;
            color: #212529;
            opacity: 0.5;
        }

            .btn-close:hover,
            .btn-close:focus {
                color: #212529;
                opacity: 0.75;
                text-decoration: none;
            }


        label {
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            font-size: 20px;
        }

        .form-group input[type="file"] {
            border-radius: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            display: block;
            border: 1px solid #ccc;
            cursor: pointer;
            width: 400px;
            height: 55px;
            padding: 10px;
            font-size: 16px;
        }

        .form-control {
            width: 400px;
            height: 55px;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
        }



        .form-select {
            width: 400px;
            height: 55px;
            padding: 10px;
            font-size: 16px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            background-color: #fff;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .btn-danger {
            background-color: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 23px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }


        .btn-success:hover {
            background-color: #b51616;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 23px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }


            .btn-success:hover {
                background-color: #218838;
            }



        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 23px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

            .btn-secondary:hover {
                background-color: #5a6268;
            }

        .containerx {
            height: 350px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            margin-bottom: 125px;
        }

            .containerx h2 {
                font-size: 3.5rem;
                margin-bottom: 50px;
            }

            .containerx p {
                font-size: 30px;
                margin-bottom: 50px;
            }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Top bar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow p-3 mb-5 bg-white rounded">
                <a class="navbar-brand">
                    <h3>Géstion des Utilisateurs</h3>
                </a>

                <%@ Import Namespace="User_Manage.Models" %>
                <% if (Session["UserLogin"] != null)
                    { %>
                <h3 class="navbar-text ml-auto">Welcome <%= Session["UserLogin"] %>!</h3>
                <% } %>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a href="test.aspx" class="nav-link">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                                </svg>
                                Déconnexion
                            </a>
                        </li>

                    </ul>
                </div>
            </nav>





            <!-- Main content -->
            <div>
                <div class="section-title" data-aos="fade-up">
                </div>



                <div class="container-fluid p-3" id="table-container">
                    <div class="card shadow border-0 mb-7" data-aos="fade-up">
                        <div class="containerx">
                            <h2 class="welcome-heading">Bienvenue dans la gestion des utilisateurs!</h2>
                            <p class="section">Cette application permet de gérer les utilisateurs en fonction de leur rôle et de leurs autorisations pour accéder aux différentes tables de données.</p>
                            <p class="section">Pour commencer, vous pouvez ajouter un nouvel utilisateur en cliquant sur le bouton "Ajouter un Utilisateur" dans la barre de navigation.</p>
                            <p class="section">Vous pouvez également modifier ou supprimer des utilisateurs existants à l'aide des boutons correspondants.</p>
                        </div>

                        <div class="table-responsive">
                            <div class="d-flex justify-content-between align-items-center form-group">
                                <div class="d-flex align-items-center ">
                                    <button type="button" class="btn btn-success btn-lg me-2 " data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                                        <i class="bi bi-plus-lg"></i>
                                        <span class="d-none d-md-inline-block">Ajouter un utilisateur</span>
                                    </button>
                                    <button type="button" class="btn btn-success btn-lg " data-bs-toggle="modal" data-bs-target="#addAutorisationModal">
                                        <i class="bi bi-plus-lg"></i>
                                        <span class="d-none d-md-inline-block">Affecter une Autorisation</span>
                                    </button>
                                </div>



                            </div>
                            <table class="table table-hover table-nowrap">
                                <thead class="thead-light">
                                    <tr class="text-center">
                                        <th class="text-center">Identifiant</th>
                                        <th class="text-center">Nom utilisateur</th>
                                        <th class="text-center">Nom rôle</th>
                                        <th class="text-center">Nom autorisation</th>
                                        <th class="text-center">Nom application</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%@ Import Namespace="User_Manage.Models" %>
                                    <%
                                        var service = new UserAccessService();
                                        var data = service.GetUserPermissions();
                                    %>
                                    <% foreach (var item in data)
                                        { %>
                                    <tr>
                                        <td class="text-center"><%= item.id_utilisateur  %></td>
                                        <td><%= item.nom_utilisateur %></td>
                                        <td><%= item.nom_role %></td>
                                        <td><%= item.nom_autorisation %></td>
                                        <td><%= item.nom_application %></td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button class="btn btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="bi bi-three-dots-vertical"></i>
                                                </button>
                                                <ul class="dropdown-menu">

                                                    <li>
                                                        <a class="dropdown-item edit-user" href="#" data-userid="<%= item.id_utilisateur %>" data-username="<%= item.nom_utilisateur %>">
                                                            <i class="bi bi-pen me-2"></i>Modifier Utilisateur
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <hr class="dropdown-divider">
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item delete-user" href="#" data-userid="<%= item.id_utilisateur %>" data-username="<%= item.nom_utilisateur %>">
                                                            <i class="bi bi-trash me-2"></i>Supprimer Utilisateur
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- AddUser Modal HTML -->


    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">


                <form runat="server">
                    <div class="modal-header">
                        <h2 class="modal-title" id="addEmployeeModalLabel">Ajouter un nouvel utilisateur</h2>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <div class="form-group">
                            <label for="NomUtilisateur" class="form-label">Nom d'utilisateur </label>
                            <asp:TextBox ID="NomUtilisateur" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez entrer un nom d'utilisateur valide.</div>
                        </div>
                        <div class="form-group">
                            <label for="MotDePasse" class="form-label">Mot de passe </label>
                            <asp:TextBox ID="MotDePasse" runat="server" CssClass="form-control" TextMode="Password" required="required" />
                            <div class="invalid-feedback">Veuillez entrer un mot de passe valide.</div>
                        </div>
                        <div class="form-group">
                            <label for="AdresseEmail" class="form-label">Adresse e-mail </label>
                            <asp:TextBox ID="AdresseEmail" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez entrer une adresse e-mail valide.</div>
                        </div>

                        <div class="form-group">
                            <label for="Roles" class="form-label">Rôles </label>
                            <asp:DropDownList ID="Roles" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner un rôle.</div>
                        </div>

                        <div class="form-group">
                            <label for="Autorisations" class="form-label">Autorisations </label>
                            <asp:DropDownList ID="Autorisations" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner une autorisation.</div>
                        </div>

                        <div class="form-group">
                            <label for="Applications" class="form-label">Applications </label>
                            <asp:DropDownList ID="Applications" runat="server" CssClass="form-control" required="required" />
                            <div class="invalid-feedback">Veuillez sélectionner une application.</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAjouter" runat="server" Text="Ajouter l'utilisateur" CssClass="btn btn-success" OnClick="AjouterUtilisateur" />
                        <asp:Button runat="server" Text="Annuler" CssClass="btn btn-secondary" data-dismiss="modal" />
                    </div>
                    <div class="alert alert-success" style="display: none;">
                        Utilisateur ajouté avec succès
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Modal HTML -->
    <% Server.Transfer("EditUser.aspx"); %>
</body>
</html>
