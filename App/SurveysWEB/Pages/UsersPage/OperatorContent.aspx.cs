using Controllers;
using Controllers.Interfaces;
using Controllers.Settings;
using InjectionModules;
using System;
using System.Drawing;
using System.Web.UI.WebControls;

namespace SurveysWEB.Pages
{
    public partial class OccurrenceContent : System.Web.UI.Page
    {
        private readonly IOccurrenceBLL _occurrenceBLL;
        private readonly ISurveyBLL _surveyBLL;


        public OccurrenceContent()
        {
            _occurrenceBLL = new OccurrenceBLL(OccurrenceModule.ConfiguratingModule());
            _surveyBLL = new SurveyBLL(SurveyModule.ConfiguratingModule());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Helper.ShowData(dgvSurvey, _surveyBLL.GetAll().Data);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            txtDescription.Value = SurveySettings.ActualSurvey.Id.ToString();
        }

        protected void dgvSurvey_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Survey = _surveyBLL.GetById(Int32.Parse(dgvSurvey.SelectedRow.Cells[0].Text));
            Survey.Data.SetActualSurvey(); //improving if Data == null...
            PaintCurrentGridRow();
        }

        protected void dgvSurvey_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.DataRow))
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvSurvey, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click on this Survey to register a Occurrence";
            }
        }

        private void PaintCurrentGridRow() // Improving
        {
            if (this.Session["PreviousRow"] != null)
            {
                var PreviousRow = (int)Session["PreviousRow"];
                GridViewRow Row = dgvSurvey.Rows[PreviousRow];
                Row.BackColor = Color.White;
            }
            GridViewRow CurrentRow = dgvSurvey.SelectedRow;
            CurrentRow.BackColor = Helper.SelectedRowColor;
            this.Session["PreviousRow"] = CurrentRow.RowIndex;

            mpeViewSurveys.Hide();
            mpeViewSurveys.Show();
        }
    }
}