<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveysModule.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.SurveysModule" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/OccurrenceModule.css" rel="stylesheet" />
    <div class="container">
        <asp:Panel ID="pnlSurveysModule" runat="server" GroupingText="Survey">
            <asp:Label ID="Label1" runat="server" Text="Id Survey"></asp:Label>
            <asp:TextBox ID="txtSurvey" runat="server"></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="Data"></asp:Label>
            <input id="txtData" type="datetime-local" />

            <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
            <select id="cmbStatus">
                <option>Opened</option>
                <option>Closed</option>
            </select>

            <asp:Label ID="Label4" runat="server" Text="Responsible"></asp:Label>
            <asp:TextBox ID="txtResponsible" runat="server"></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
            <textarea id="txtDescription" cols="20" rows="2"></textarea>

            <asp:Label ID="Label6" runat="server" Text="Adress"></asp:Label>
            <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox>

            <asp:Label ID="Label7" runat="server" Text="Local Image"></asp:Label>
            <asp:FileUpload ID="FileLocalImage" runat="server" />
        </asp:Panel>
        <div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
            <asp:Button ID="btnBack" runat="server" Text="Back" />
        </div>
    </div>
</asp:Content>
