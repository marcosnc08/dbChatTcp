<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" Interval="500"></asp:Timer>
    <div><a href="salaDeEspera.aspx">Volver a la Sala de Espera</a></div>
    <div class="span1 left conver">
        <div class="page-form rounded-corners-1 ventana-de-chat">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ListView ID="lvMensajes" runat="server">
                        <ItemTemplate>
                            <div class="mensaje"><%# Eval("Login") %>: <%# Eval("Texto") %></div>
                        </ItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="page-form rounded-corners-1">
        <asp:TextBox ID="txtMensaje" CssClass="mensaje-de-chat" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Height="80px" Width="80px"
            onclick="btnEnviar_Click" />
        </div>
    
    </div>
    
    <div class="span1 left page-form rounded-corners-1">
        <h3>Usuarios Conectados:</h3>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:ListView ID="lvUsuarios" runat="server">
                    <ItemTemplate>
                        <div class="usuarios">- <%# Eval("Login") %></div>
                    </ItemTemplate>
                </asp:ListView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>
        </asp:UpdatePanel>
    </div>  
</asp:Content>