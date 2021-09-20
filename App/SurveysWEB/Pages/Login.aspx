<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.Login" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/Login.css" rel="stylesheet" runat="server" />
    
    <div class="statusLogin">
        <asp:Label ID="lblStatusLogin" ForeColor="Red" runat="server"></asp:Label>
    </div>
    <div class="container">
        <h2>Sign-up</h2>
        <div>
            <input id="txtLogin" type="text" runat="server" placeholder="Enter Login" />
        </div>
        <div>
            <input id="txtPassword" type="text" runat="server" placeholder="Enter Password" />
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </div>

</asp:Content>
