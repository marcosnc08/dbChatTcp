<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sala de Chat - Login</title>
    <link rel="Stylesheet" href="media/css/styles.css" type="text/css"/>
    <link rel="Stylesheet" href="media/css/cupertino/jquery-ui-1.10.3.custom.min.css"
        type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="content centrado">
        <div class="span1 right">
           <div class="page-form rounded-corners-1">
                <h2>Entrar</h2>
                <div class="row">
                    <div class="span1 left">Usuario:</div>
                    <div class="span1 right">
                        <asp:TextBox ID="txtUsuario" CssClass="rounded-corners-2" runat="server" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rVlUsuario" runat="server" 
                            ErrorMessage="Ingrese usuario" ControlToValidate="txtUsuario" 
                            ValidationGroup="ingresar"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="span1 left">Contraseña:</div> 
                    <div class="span1 right">
                        <asp:TextBox ID="txtContra" CssClass="rounded-corners-2" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rVlContra" runat="server" 
                            ErrorMessage="Ingrese contraseña" ControlToValidate="txtContra" 
                            ValidationGroup="ingresar"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <asp:Label ID="lblLog" runat="server"></asp:Label>
                </div>
                <div class="row text-center">
                    <asp:Button ID="btnLog" CssClass="send" runat="server" Text="Entrar" 
                        OnClick="btnLog_Click" ValidationGroup="ingresar" />
                </div>
            </div>
        </div>
        <div class="span1 left">
            <div class="page-form rounded-corners-1">
                <h2>¿no estas registrado?</h2>
                <div class="row">
                    <div class="span1 left">Usuario: </div>
                    <div class="span1 right">
                        <asp:TextBox ID="txtUsuarioRegistro" CssClass="rounded-corners-2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vlUsuario" runat="server" 
                            ErrorMessage="Ingrese usuario" ControlToValidate="txtUsuarioRegistro" 
                            ValidationGroup="registro"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="span1 left">Contraseña: </div>
                    <div class="span1 right">
                        <asp:TextBox ID="txtContraRegistro" CssClass="rounded-corners-2" runat="server" TextMode="Password"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="span1 left">Repetir contraseña: </div>
                    <div class="span1 right">
                    <asp:TextBox ID="txtContraRegistroVerificacion" CssClass="rounded-corners-2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="cmpContra" runat="server" ErrorMessage="No coinciden las contraseñas." 
                            ControlToValidate="txtContraRegistroVerificacion" 
                            ControlToCompare="txtContraRegistro" ValidationGroup="registro"></asp:CompareValidator>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="lblLogRegistro" CssClass="error text-center rounded-corners-1 row" runat="server"></asp:Label>
                </div>
                <div class="row text-center">
                    <asp:Button ID="btnRegistro" CssClass="send" runat="server" Text="Registrarme" 
                        onclick="btnRegistro_Click" ValidationGroup="registro"/>
                </div>
            </div>
        </div>
    </div>
 
    </form>
</body>
<script type="text/javascript" src="media/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="media/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("input[type=submit], a, button")
      .button()
    });
</script>
</html>
