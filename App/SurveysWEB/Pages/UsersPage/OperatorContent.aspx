<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" EnableEventValidation="false" Inherits="SurveysWEB.Pages.UsersPage.OperatorContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/OperatorContent.css" rel="stylesheet" runat="server" />
    <div class="container">
        <h1>Operator Logged</h1>
        <div>
        </div>
        <div>
            <asp:Button ID="btnRegisterOccurrence" runat="server" Text="Register Occurence" />
            <div>
                <asp:Button ID="btnViewOccurences" runat="server" Text="View Occurences" />
            </div>
        </div>

        <asp:Panel ID="pnlSurveys" runat="server" CssClass="modalPopup">
            <div>
                <asp:GridView ID="dgvSurvey" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" CssClass="dgvSurveys" Width="890px" OnRowDataBound="dgvSurvey_RowDataBound" OnSelectedIndexChanged="dgvSurvey_SelectedIndexChanged">
                </asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnCloseSurveys" runat="server" Text="Close" />
            </div>
            <div>
                <asp:Button ID="btnOccurrenceRegister" runat="server" Text="Register Occurrence" OnClick="btnOccurrenceRegister_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlRegisterOccurrence" runat="server" CssClass="modalPopup">
            <div class="container-registerOccurrence">

                <asp:Panel ID="pnlSurveysDetails" runat="server">
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Survey Adress"></asp:Label>
                        <asp:TextBox ID="txtSurveyAdress" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="Survey Responsible"></asp:Label>
                        <asp:TextBox ID="txtSurveyResponsible" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Survey OpeningDate"></asp:Label>
                        <asp:TextBox ID="dtpSurveyOpeningDate" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                </asp:Panel>

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
                    <asp:TextBox ID="dtpDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                    <select id="cmbType" runat="server">
                        <option>Environmental</option>
                        <option>Patrimonial</option>
                    </select>
                </div>
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                    <textarea id="txtDescription" runat="server"></textarea>
                </div>
            </div>

            <div>
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnCloseRegisterOccurrence_Click" />
            </div>
            <div>
                <asp:Button ID="btnRegisterOcc" runat="server" Text="Register Occurrence" OnClick="btnRegisterOcc_Click" />
            </div>
            <div>
                <asp:Button ID="btnCloseRegisterOccurrence" runat="server" Text="Close" OnClick="btnCloseRegisterOccurrence_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlViewOccurrences" runat="server" CssClass="modalPopup">
            <asp:Panel ID="pnlFilters" runat="server">
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                    <select id="Select1" runat="server">
                        <option>Opened</option>
                        <option>Closed</option>
                    </select>
                </div>
                <div>
                    <asp:Label ID="Label8" runat="server" Text="Date From"></asp:Label>
                    <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="Date To"></asp:Label>
                    <asp:TextBox ID="txtDateTo" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label11" runat="server" Text="Adress"></asp:Label>
                    <asp:TextBox ID="txtAdressFilter" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label10" runat="server" Text="Responsible"></asp:Label>
                    <asp:TextBox ID="txtResponsibleFilter" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>
            <div>
                <asp:GridView ID="dgvOccurrences" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" CssClass="dgvSurveys" Width="890px" OnRowDataBound="dgvOccurrences_RowDataBound" OnSelectedIndexChanged="dgvOccurrences_SelectedIndexChanged"></asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnCloseViewOccurrences" runat="server" Text="Close" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="mpeViewSurveys" runat="server" CancelControlID="btnOccurrenceRegister" BackgroundCssClass="modalBackround" PopupControlID="pnlSurveys" TargetControlID="btnRegisterOccurrence" BehaviorID="mpeViewSurveys">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeRegisterOccurence" runat="server" CancelControlID="btnCloseRegisterOccurrence" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterOccurrence" TargetControlID="btnOccurrenceRegister" BehaviorID="mpeRegisterOccurence">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeViewOccurrences" runat="server" CancelControlID="btnCloseViewOccurrences" BackgroundCssClass="modalBackround" PopupControlID="pnlViewOccurrences" TargetControlID="btnViewOccurences">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
