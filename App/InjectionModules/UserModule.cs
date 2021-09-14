using Models;
using Models.Entities.Interfaces;
using Ninject;
using Ninject.Modules;
using System.Reflection;

namespace InjectionModules
{
    public class UserModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IUser>().To<User>();
        }
        public static IUser ConfiguratingModule()
        {
            StandardKernel kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            return kernel.Get<IUser>();
        }
    }
}
