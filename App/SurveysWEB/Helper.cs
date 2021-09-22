using AjaxControlToolkit;
using System.Collections;
using System.Drawing;
using System.Web.UI.WebControls;

namespace SurveysWEB
{
    public static class Helper
    {
        public const int R = 58,
                         G = 192,
                         B = 242;

        public static Color SelectedRowColor = Color.FromArgb(R, G, B);


        public static string DisplayAlert(string message) => $"<script>alert('{message}');</script>";

        public static void ShowData(GridView dgv, IEnumerable data)
        {
            dgv.DataSource = data;
            dgv.DataBind();
        }
    }
}