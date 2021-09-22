using Controllers;
using Controllers.Interfaces;
using Controllers.Settings;
using InjectionModules;
using System;

namespace SurveysWEB.Pages
{
    public partial class AdminContent : System.Web.UI.Page
    {
        private readonly IUserBLL _userBLL;

        public AdminContent()
        {
            _userBLL = new UserBLL(UserModule.ConfiguratingModule());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAdminLogged.Text += UserSettings.UserLogged.Login;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var user = _userBLL.Create();
            user.UserType = (byte)cmbUserType.SelectedIndex;
            user.Name = txtName.Text;
            user.Cpf = txtCpf.Text;
            user.Login = txtLogin.Text;
            user.Email = txtEmail.Text;
            user.Password = txtPassword.Text;

            var response = _userBLL.Insert(user);

            Response.Write(Helper.DisplayAlert(response.Message));
        }
    }
}