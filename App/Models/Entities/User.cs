using Models.Entities.Interfaces;

namespace Models
{
    public class User : IUser
    {
        #region Properties
        public int Id { get; set; }
        public byte UserType { get; set; }
        public string Name { get; set; }
        public string Cpf { get; set; }
        public string Login { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        #endregion
    }
}
