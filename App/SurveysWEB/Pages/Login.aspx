<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.Login" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/Login.css" rel="stylesheet" runat="server" />
    
    <div class="statusLogin">
        <asp:Label ID="lblStatusLogin" ForeColor="Red" runat="server"></asp:Label>
    </div>
    <div class="container">
        <h2>Sign-up</h2> 
        <div>
            <input id="txtLogin" type="text" runat="server" placeholder="Enter Login" style="width: 350px; height: 35px; font-size: 20px; border-color: black; border-style: solid; border-radius: 5px; border-width: 1px"/>
        </div>
        <div>
            <input id="txtPassword" type="text" runat="server" placeholder="Enter Password" style=" margin-block: 15px; width: 350px; height: 35px; font-size: 20px; border-color: black; border-style: solid; border-radius: 5px; border-width: 1px" />
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Style="width: 250px; height: 50px; margin-left: 15%; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 20px"/>
        </div>
    </div>
</asp:Content>
