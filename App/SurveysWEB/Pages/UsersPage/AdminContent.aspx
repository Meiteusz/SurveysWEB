<% @ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.AdminContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/AdminContent.css" rel="stylesheet" runat="server" />
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="container">
        <asp:Label ID="lblAdminLogged" runat="server" Text="Admin Logged: "></asp:Label>
    </div>

    <div>
        <asp:Button ID="btnRegisterUser" runat="server" Text="Register User" />
    </div>
    <div>
        <asp:Button ID="btnViewUsers" runat="server" Text="View Users" />
    </div>


    <asp:Panel runat="server" ID="pnlRegisterUser" CssClass="modalPopup"> <!-- Register User -->

        <div class="container-registerUser">
            <asp:Label ID="Label2" runat="server" Text="User Type"></asp:Label>
            <select id="cmbUserType" runat="server">
                <option>Admin</option>
                <option>Analyst</option>
                <option>Operator</option>
            </select>

            <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="Cpf"></asp:Label>
            <asp:TextBox ID="txtCpf" runat="server"></asp:TextBox>

            <asp:Label ID="Label6" runat="server" Text="Login"></asp:Label>
            <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>

            <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>

            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"></asp:Button>
            </div>
        </div>

        <div>
            <asp:Button ID="btnCloseRegisterUserModal" runat="server" Text="Close" />
        </div>
    </asp:Panel> <!-- Register User -->

    <asp:Panel runat="server" ID="pnlViewUsers" CssClass="modalPopup">
        <div>
            <div>
                <asp:Button ID="btnCloseViewUsersModal" runat="server" Text="Close" />
            </div>
        </div>
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnCloseRegisterUserModal" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterUser" TargetControlID="btnRegisterUser">
    </ajaxToolkit:ModalPopupExtender>
    <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnCloseViewUsersModal" BackgroundCssClass="modalBackround" PopupControlID="pnlViewUsers" TargetControlID="btnViewUsers">
    </ajaxToolkit:ModalPopupExtender>
</asp:Content>

