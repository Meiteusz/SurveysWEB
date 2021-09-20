namespace Models.Settings
{
    public static class UserSettings
    {
        public static User UserLogged { get; private set; }

        public static void SetUserLogged(this User user)
        {
            UserLogged = user;
        }
    }
}
