using Models;

namespace Controllers.Interfaces
{
    public interface IUserBLL
    {
        User Create();
        ResponseData<User> Login(User user);
        Response Insert(User user);
        Response Update(User user);
        ResponseData<string> OpenContentUserType(byte userType);
    }
}
