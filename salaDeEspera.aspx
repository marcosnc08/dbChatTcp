<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="salaDeEspera.aspx.cs" Inherits="salaDeEspera" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Sala de espera</h2>
    <asp:GridView ID="gvSalas" runat="server" onrowcommand="gvSalas_RowCommand" AutoGenerateColumns="false">
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
                    <asp:LinkButton ID="lnkEntrar" runat="server" commandName="Entrar" Text="Entrar" />
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:GridView>
    </asp:Content>


