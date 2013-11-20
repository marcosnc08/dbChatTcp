<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="salaDeEspera.aspx.cs" Inherits="salaDeEspera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="2000">
            </asp:Timer>
            <div class="page-form rounded-corners-1">
                <h2>Sala de espera</h2>
                <asp:GridView ID="gvSalas" runat="server" AutoGenerateColumns="false" 
                    onrowcommand="gvSalas_RowCommand">
                    <columns>
                        <asp:TemplateField HeaderText="IdSala">
                            <ItemTemplate>
                                <asp:Label ID="lblIdSala" runat="server" Text='<%# Eval("idSala") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <ItemTemplate>
                                <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEntrar" runat="server" commandName="Entrar" 
                                    Text="Entrar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lknBorrarSala" runat="server" CommandName="BorrarSala" 
                                    Text="Borrar"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <div class="page-form rounded-corners-1">
    <h3>Crear nueva sala:</h3>
    Nombre de sala: <asp:TextBox ID="txtNuevaSalaNombre" CssClass="rounded-corners-2" runat="server"></asp:TextBox>
    <asp:Button ID="btnCrearSala" Text="Crear" runat="server" 
        onclick="btnCrearSala_Click" />
    </div>
    <asp:Label ID="lblErrores" runat="server"></asp:Label>
    </asp:Content>


    
    

    


