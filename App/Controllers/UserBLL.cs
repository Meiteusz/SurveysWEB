using Controllers.Interfaces;
using Models;
using Models.Daos.Interfaces;
using Models.Settings;
using System;

namespace Controllers
{
    public class UserBLL : IUserBLL
    {
        private readonly IUserDao _userDao;

        public UserBLL(IUserDao userDao)
        {
            _userDao = userDao;
        }

        public User Create() => new User();

        public ResponseData<User> Login(User user)
        {
            var response = _userDao.Login(user);

            if (response.Success)
                response.Data.SetUserLogged();
            return response;
        }

        public Response Insert(User user)
        {
            return _userDao.Insert(user);
        }

        public Response Update(User user)
        {
            return _userDao.Update(user);
        }

        public ResponseData<string> OpenContentUserType(byte userType)
        {
            ResponseData<string> response = new ResponseData<string>();

            string way = @"~/Pages/UsersPage/";

            //Improving

            try
            {
                if (userType.Equals(0)) // 0 = Admin
                    response.Data = way + "AdminContent.aspx";
                else if (userType.Equals(1))
                    response.Data = way + "AnalystContent.aspx";
                else
                    response.Data = way + "OperatorContent.aspx";
            }
            catch (Exception ex)
            {
                //Screen error???
            }

            return response;
        }
    }
}
