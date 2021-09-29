<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnalystContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" EnableEventValidation="false" Inherits="SurveysWEB.Pages.UsersPage.AnalystContent" %>

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
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="buttons-default" Style="margin-left: 53px;" OnClick="btnRegister_Click"></asp:Button>
                    <asp:Button ID="btnCloseRegisterSurvey" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 670px;"></asp:Button>
                </div>
            </div>
        </asp:Panel>
    </div>

    <asp:Panel runat="server" ID="pnlViewSurveys" CssClass="modalPopup">
        <asp:Panel ID="pnlFilters" runat="server">
            <div>
                <asp:Label ID="Label8" runat="server" Text="Status"></asp:Label>
                <select id="Select1" runat="server">
                    <option>Environmental</option>
                    <option>Patrimonial</option>
                </select>
            </div>
            <div>
                <asp:Label ID="Label9" runat="server" Text="Date From"></asp:Label>
                <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Text="Date To"></asp:Label>
                <asp:TextBox ID="txtDateTo" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label11" runat="server" Text="Survey Responsible"></asp:Label>
                <asp:TextBox ID="txtSurveyResponsibleFilter" runat="server"></asp:TextBox>
            </div>
        </asp:Panel>
        <div class="container-viewSurvey">
            <asp:GridView ID="dgvSurveys" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" Style="margin-left: 53px;" Width="1074px" OnRowDataBound="dgvSurveys_RowDataBound" OnSelectedIndexChanged="dgvSurveys_SelectedIndexChanged"></asp:GridView>
        </div>
        <div>
            <asp:Button ID="btnCloseViewSurveys" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 53px; margin-block: 23%;" />
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlDetailsSurvey" CssClass="modalPopupDetail">
        <asp:Button ID="btnTeste" runat="server" Text="Button" />
        <!-- Clear -->
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttons-controls" Style="margin-left: 438px;" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="buttons-controls" Style="background-color: darkred; color: white" />
        </div>
        <div>
            <div>
                <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
                <select id="cmbStatus" runat="server">
                    <option>Environmental</option>
                    <option>Patrimonial</option>
                </select>
            </div>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Data"></asp:Label>
                <asp:TextBox ID="txtOpeningDateDetail" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div>
                <asp:Image ID="LocalImage" runat="server" Width="200px" Height="200px" />
            </div>
            <div>
                <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
                <textarea id="txtDescriptionDetail" cols="20" rows="2" runat="server"></textarea>
            </div>
            <div>
                <asp:Label ID="Label12" runat="server" Text="Adress"></asp:Label>
                <asp:TextBox ID="txtAdressDetail" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label13" runat="server" Text="Responsible"></asp:Label>
                <asp:TextBox ID="txtResponsibleDetail" runat="server"></asp:TextBox>
            </div>
        </div>
        <div>
            <div>
                <asp:Button ID="btnBackDetailsSurvey" runat="server" Text="Back" CssClass="buttons-controls" Style="margin-left: 53px; margin-block: 25%" OnClick="btnBackDetailsSurvey_Click" />
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass="buttons-controls" Style="margin-left: 130px;" />
                <asp:Button ID="btnCloseDetailsSurvey" runat="server" Text="Close" CssClass="buttons-controls" Style="margin-left: 100px;" />
            </div>
        </div>
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="mpeRegisterSurvey" runat="server" CancelControlID="btnCloseRegisterSurvey" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterSurvey" TargetControlID="btnRegisterSurvey">
    </ajaxToolkit:ModalPopupExtender>
    <ajaxToolkit:ModalPopupExtender ID="mpeViewSurveys" runat="server" CancelControlID="btnCloseViewSurveys" BackgroundCssClass="modalBackround" PopupControlID="pnlViewSurveys" TargetControlID="btnViewSurveys">
    </ajaxToolkit:ModalPopupExtender>
    <ajaxToolkit:ModalPopupExtender ID="mpeDetailsSurveys" runat="server" CancelControlID="btnCloseDetailsSurvey" BackgroundCssClass="modalBackround" PopupControlID="pnlDetailsSurvey" TargetControlID="btnTeste">
    </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
