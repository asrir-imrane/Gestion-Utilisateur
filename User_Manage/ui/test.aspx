<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/ui/test.aspx.cs" Inherits="User_Manage.ui.test" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="../Assets/css/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../Assets/css/StyleSheet.css">
    <script src="../Assets/scripts/vue.min.js"></script>
    <script src="../Assets/scripts/Login.js"></script>


</head>
<body>

    <div id="app" runat="server">

        <div class="login-page">

            <div v-if="!registeractive" class="wallpaper-login"></div>


            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-8 mx-auto text-center">
                        <form class="form-signin" runat="server">
                            <h1>Login</h1>
                            <img class="mb-4" src="../Assets/images/ONEE.png" alt="" width="164" height="114">


                            <div class=" mb-3  form-floating">
                                <input v-model="userLogin" type="text" class="form-control" placeholder="User Name" runat="server" id="UserLogin" required>
                                <label for="UserLogin">User Name</label>
                            </div>
                            <div class=" mb-3  form-floating">
                                <input v-model="passwordlogin" type="password" class="form-control" placeholder="Password" runat="server" id="passwordLogin" required>
                                <label for="passwordLogin">Password</label>
                            </div>



                            <asp:Button type="submit" Text="Sign in" runat="server" class="w-100  btn btn-lg btn-primary" OnClick="LoginButton_Click"></asp:Button>
                            <div class="mt-4">
                                <asp:Label runat="server" ID="errorMessage" Visible="false" Text="Invalid email or password" CssClass=" alert alert-danger"></asp:Label>
                                <asp:Label runat="server" ID="successMessage" Text="You have successfully logged in!" Visible="false" CssClass=" alert alert-success"></asp:Label>

                            </div>
                            


                            <p class="mt-5 mb-3 text-muted">&copy; 2023–2024</p>
                        </form>




                    </div>
                </div>


            </div>
        </div>


    </div>





</body>
</html>
