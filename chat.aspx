<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div><a href="salaDeEspera.aspx">Volver a la Sala de Espera</a></div>
    <div class="span1 left conver">
        <div class="page-form rounded-corners-1">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000">
                    </asp:Timer>
                    <asp:ListView ID="lvMensajes" runat="server">
                        <ItemTemplate>
                            <div class="mensaje"><%# Eval("Login") %>: <%# Eval("Texto") %></div>
                        </ItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>
        <div class="page-form rounded-corners-1">
        <asp:TextBox ID="txtMensaje" CssClass="mensaje-de-chat" runat="server"></asp:TextBox>
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Height="80px" Width="80px"
            onclick="btnEnviar_Click" />
        </div>
    
    </div>
    
    <div class="span1 left page-form rounded-corners-1">
        <h3>Usuarios Conectados:</h3>
        <asp:ListView ID="lvUsuarios" runat="server">
            <ItemTemplate>
                <div class="usuarios">- <%# Eval("Login") %></div>
            </ItemTemplate>
        </asp:ListView>
    </div>  
</asp:Content>


