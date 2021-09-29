using Controllers.Settings;
using System;

namespace SurveysWEB.Pages
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogoutt_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            UserSettings.SetUserLogged(null);
            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}