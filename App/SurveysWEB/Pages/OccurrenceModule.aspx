<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OccurrenceModule.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.OccurrenceModule" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/SurveysModule.css" rel="stylesheet" />
    <div class="container">
        <asp:Panel ID="pnlSurveysModule" runat="server" GroupingText="Survey">
            <asp:Label ID="Label1" runat="server" Text="Id Survey"></asp:Label>
            <asp:TextBox ID="txtSurvey" runat="server"></asp:TextBox>

            <asp:Label ID="Label8" runat="server" Text="Id Occurrence"></asp:Label>
            <asp:TextBox ID="txtOccurrence" runat="server"></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="Data"></asp:Label>
            <input id="txtData" type="datetime-local" />

            <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
            <select id="cmbType">
                <option>Environmental</option>
                <option>Patrimonial</option>
            </select>

            <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
            <textarea id="txtDescription" cols="20" rows="2"></textarea>

        </asp:Panel>
        <div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
            <asp:Button ID="btnBack" runat="server" Text="Back" />
        </div>
    </div>
</asp:Content>
