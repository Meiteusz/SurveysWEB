<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnalystContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.UsersPage.AnalystContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/AnalystContent.css" rel="stylesheet" runat="server" />

    <div class="container">
        <h1>Analyst Logged</h1>

        <div>
            <asp:Button ID="btnRegisterSurvey" runat="server" Text="Register Survey" />
        </div>
        <div>
            <asp:Button ID="btnViewSurveys" runat="server" Text="View Surveys" />
        </div>

        <asp:Panel runat="server" ID="pnlRegisterSurvey" CssClass="modalPopup">
            <div class="container-registerSurvey">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Data"></asp:Label>
                    <asp:TextBox ID="dtpOpeningDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                    <textarea id="txtDescription" cols="20" rows="2" runat="server"></textarea>
                </div>
                <div>
                    <asp:Label ID="Label6" runat="server" Text="Adress"></asp:Label>
                    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Local Image"></asp:Label>
                    <asp:FileUpload ID="FileLocalImage" accept="" runat="server" />
                </div>

                <div>
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"></asp:Button>
                </div>
                <div>
                    <asp:Button ID="btnCloseRegisterSurvey" runat="server" Text="Close" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlViewSurveys" CssClass="modalPopup">
            <div class="container-viewSurvey">
                <asp:GridView ID="dgvSurveys" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" Width="890px"></asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnCloseViewSurveys" runat="server" Text="Close" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnCloseRegisterSurvey" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterSurvey" TargetControlID="btnRegisterSurvey">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnCloseViewSurveys" BackgroundCssClass="modalBackround" PopupControlID="pnlViewSurveys" TargetControlID="btnViewSurveys">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
