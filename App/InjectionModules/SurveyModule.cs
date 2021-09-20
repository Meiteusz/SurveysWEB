using Models.Daos;
using Models.Daos.Interfaces;
using Ninject;
using Ninject.Modules;
using System.Reflection;

namespace InjectionModules
{
    public class SurveyModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ISurveyDao>().To<SurveyDao>();
        }
        public static ISurveyDao ConfiguratingModule()
        {
            StandardKernel kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            return kernel.Get<ISurveyDao>();
        }
    }
}
