using System.Collections.Generic;

namespace Models.Daos.Interfaces
{
    public interface IUserDao
    {
        ResponseData<User> Login(User p_user);
        Response Insert(User p_user);
        Response Update(User p_user);
        ResponseData<User> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll(int p_Id);
    }
}
