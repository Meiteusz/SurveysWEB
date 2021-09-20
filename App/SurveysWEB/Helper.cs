using System.Collections;
using System.Web.UI.WebControls;

namespace SurveysWEB
{
    public static class Helper
    {
        public static string DisplayAlert(string message) =>
            $"<script>alert('{message}');</script>";

        public static void ShowData(GridView dgv, IEnumerable data)
        {
            dgv.DataSource = data;
            dgv.DataBind();
        }
    }
}