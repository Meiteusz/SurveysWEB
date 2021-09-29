using Models.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Models.Daos
{
    public class UserDao : IUserDao
    {
        public ResponseData<User> Login(User p_user)
        {
            ResponseData<User> response = new ResponseData<User>();
            User LoggedUser = new User();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    LoggedUser = context.Users.SingleOrDefault(u => u.Login.Equals(p_user.Login) && u.Password.Equals(p_user.Password));
                }

                if (LoggedUser != null)
                {
                    response.Success = true;
                    response.Message = "User logged";
                    response.Data = LoggedUser;
                }
                else
                {
                    response.Message = "User not finded";
                }

            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
            }
            return response;
        }

        public Response Insert(User p_user)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Users.Add(p_user);
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "User Registered succeffuly";
                }
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
            }
            return response;
        }

        public Response Update(User p_user)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Entry(p_user).State = EntityState.Modified;
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "User Updated";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<User> GetById(int p_Id)
        {
            ResponseData<User> response = new ResponseData<User>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var user = context.Users.FirstOrDefault(u => u.Id.Equals(p_Id));

                    response.Success = true;
                    response.Data = user;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<List<User>> GetAll()
        {
            ResponseData<List<User>> response = new ResponseData<List<User>>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var usersList = context.Users.ToList();

                    response.Success = true;
                    response.Data = usersList;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
