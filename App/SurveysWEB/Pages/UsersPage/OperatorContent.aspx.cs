using AjaxControlToolkit;
using Controllers;
using Controllers.Interfaces;
using Controllers.Settings;
using InjectionModules;
using System;
using System.Drawing;
using System.Web.UI.WebControls;

namespace SurveysWEB.Pages.UsersPage
{
    public partial class OperatorContent : System.Web.UI.Page
    {
        private readonly IOccurrenceBLL _occurrenceBLL;
        private readonly ISurveyBLL _surveyBLL;
        private readonly IUserBLL _userBLL;

        public OperatorContent()
        {
            _occurrenceBLL = new OccurrenceBLL(OccurrenceModule.ConfiguratingModule());
            _surveyBLL = new SurveyBLL(SurveyModule.ConfiguratingModule());
            _userBLL = new UserBLL(UserModule.ConfiguratingModule());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Helper.ShowData(dgvSurvey, _surveyBLL.GetAll().Data);
                Helper.ShowData(dgvOccurrences, _occurrenceBLL.GetAll().Data);
                cmbTybeDetail.Disabled = true;
                txtDateDetail.Enabled = false;
                txtDescriptionDetail.Disabled = true;
            }
        }

        protected void btnOccurrenceRegister_Click(object sender, EventArgs e)
        {
            mpeRegisterOccurence.Show();
            mpeViewSurveys.Hide();

            txtSurveyAdress.Text = SurveySettings.ActualSurvey.Adress;
            txtSurveyResponsible.Text = _userBLL.GetById(OccurrenceSettings.ActualOccurrece.SurveyId).Data.Name; //Change
            dtpSurveyOpeningDate.Text = SurveySettings.ActualSurvey.OpeningDate.ToString("yyyy-MM-dd");
        }

        protected void btnRegisterOcc_Click(object sender, EventArgs e)
        {
            var occurrence = _occurrenceBLL.Create(); //improving
            occurrence.Type = (byte)cmbType.SelectedIndex;
            occurrence.Date = DateTime.Parse(dtpDate.Text);
            occurrence.Description = txtDescription.Value;

            var response = _occurrenceBLL.Insert(occurrence);

            Response.Write(Helper.DisplayAlert(response.Message));
        }

        protected void btnCloseRegisterOccurrence_Click(object sender, EventArgs e)
        {
            mpeViewSurveys.Show();
            mpeRegisterOccurence.Hide();
        }

        protected void dgvOccurrences_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.DataRow))
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvOccurrences, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click on this Occurrence to view details";
            }
        }

        protected void dgvOccurrences_SelectedIndexChanged(object sender, EventArgs e)
        {
            var occurrence = _occurrenceBLL.GetById(Int32.Parse(dgvOccurrences.SelectedRow.Cells[0].Text));

            if (occurrence.Data.Equals(null))
            {
                Response.Write(Helper.DisplayAlert("Error with this Occurrence"));
            }
            else
            {
                OccurrenceSettings.SetActualOccurrece(occurrence.Data); //improving if Data == null...

                var survey = _surveyBLL.GetById(OccurrenceSettings.ActualOccurrece.SurveyId); // Improving

                cmbTybeDetail.SelectedIndex = OccurrenceSettings.ActualOccurrece.Type;
                txtDateDetail.Text = OccurrenceSettings.ActualOccurrece.Date.ToString("yyyy-MM-dd");
                txtDescriptionDetail.Value = OccurrenceSettings.ActualOccurrece.Description;
                txtSurveyAdressDetail.Text = survey.Data.Adress;
                txtSurveyResponsibleDetail.Text = _userBLL.GetById(survey.Data.AnalistId).Data.Name; // change
                txtSurveyOpeningDateDetail.Text = survey.Data.OpeningDate.ToString("yyyy-MM-dd");

                mpeDetailOccurrence.Show();
            }

        }

        protected void dgvSurvey_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.DataRow))
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvSurvey, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click on this Survey to register a Occurrence";
            }
        }

        protected void dgvSurvey_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Survey = _surveyBLL.GetById(Int32.Parse(dgvSurvey.SelectedRow.Cells[0].Text));
            Survey.Data.SetActualSurvey(); //improving if Data == null...
            PaintCurrentGridRow(dgvSurvey, mpeViewSurveys);
        }

        protected void btnDetailBack_Click(object sender, EventArgs e)
        {
            mpeViewOccurrences.Show();
            mpeDetailOccurrence.Hide();
        }

        private void PaintCurrentGridRow(GridView dgv, ModalPopupExtender mpe) // Improving
        {
            if (this.Session["PreviousRow"] != null)
            {
                var PreviousRow = (int)Session["PreviousRow"];
                GridViewRow Row = dgv.Rows[PreviousRow];
                Row.BackColor = Color.White;
            }
            GridViewRow CurrentRow = dgv.SelectedRow;
            CurrentRow.BackColor = Helper.SelectedRowColor;
            this.Session["PreviousRow"] = CurrentRow.RowIndex;

            mpe.Hide();
            mpe.Show();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            cmbTybeDetail.Disabled = false;
            txtDateDetail.Enabled = true;
            txtDescriptionDetail.Disabled = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var response = _occurrenceBLL.Delete(OccurrenceSettings.ActualOccurrece);
            Response.Write(Helper.DisplayAlert(response.Message));
            mpeDetailOccurrence.Hide();
        }
    }
}