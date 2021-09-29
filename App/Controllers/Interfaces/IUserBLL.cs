using Models;
using System.Collections.Generic;

namespace Controllers.Interfaces
{
    public interface IUserBLL
    {
        User Create();
        ResponseData<User> Login(User user);
        Response Insert(User user);
        Response Update(User user);
        ResponseData<List<User>> GetAll();
        ResponseData<User> GetById(int p_Id);
        ResponseData<string> OpenContentUserType(byte userType);
    }
}
