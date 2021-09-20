using Models.Daos;
using Models.Daos.Interfaces;
using Ninject;
using Ninject.Modules;
using System.Reflection;

namespace InjectionModules
{
    public class UserModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IUserDao>().To<UserDao>();
        }
        public static IUserDao ConfiguratingModule()
        {
            StandardKernel kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            return kernel.Get<IUserDao>();
        }
    }
}
