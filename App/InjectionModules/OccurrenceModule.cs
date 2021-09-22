using Controllers;
using Controllers.Interfaces;
using Models.Daos;
using Ninject;
using Ninject.Modules;
using System.Reflection;

namespace InjectionModules
{
    public class OccurrenceModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IOccurrenceDao>().To<OccurrenceDao>();
        }
        public static IOccurrenceDao ConfiguratingModule()
        {
            StandardKernel kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            return kernel.Get<IOccurrenceDao>();
        }
    }
}
