using Controllers;
using Controllers.Interfaces;
using InjectionModules;
using System;

namespace SurveysWEB.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly IUserBLL _userBLL;

        public Login()
        {
            _userBLL = new UserBLL(UserModule.ConfiguratingModule());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtLogin.Value = "Analyst";
            txtPassword.Value = "123";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var user = _userBLL.Create();
            user.Login = txtLogin.Value;
            user.Password = txtPassword.Value;

            var response = _userBLL.Login(user);

            if (response.Success)
                Response.Redirect(_userBLL.OpenContentUserType(response.Data.UserType).Data);
            else
                lblStatusLogin.Text = "Login or Password wrong";
        }
    }
}