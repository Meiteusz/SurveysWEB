using Controllers.Interfaces;
using Controllers.Settings;
using Models;
using Models.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using Validations;

namespace Controllers
{
    public class UserBLL : UserValidator, IUserBLL
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

        public ResponseData<List<User>> GetAll()
        {
            return _userDao.GetAll();
        }

        public ResponseData<User> GetById(int p_Id)
        {
            return _userDao.GetById(p_Id);
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
