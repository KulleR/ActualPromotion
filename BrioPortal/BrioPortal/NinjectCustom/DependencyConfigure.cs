﻿using Ninject;
using Ninject.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Http.WebHost;
using System.Web.Http;
using Brio;
using Brio.Models;



namespace BrioPortal
{
    /// <summary>
    /// Предоставляет методы конфигурации разрешения зависемостей
    /// </summary>
    public class DependencyConfigure
    {
        /// <summary>
        /// Инициализация и конфигурирование контейнера IoC. Регистрация зависемостей.
        /// </summary>
        public static void Initialize()
        {
            IKernel kernel = new StandardKernel();
            kernel.Bind<IDataContext>().To<Entities>().InRequestScope();
            kernel.Bind(typeof(IRepository<>)).To(typeof(Repository<>));
            kernel.Bind<IUserRepository>().To<UserRepository>();
            kernel.Bind<IArticleRepository>().To<ArticleRepository>();
            kernel.Bind<IRoleRepository>().To<RoleRepository>();
            kernel.Bind<IAuthentication>().To<CustomAuthentication>().InRequestScope();
            kernel.Bind<IBrioContext>().To<BrioContext>().InRequestScope();
            kernel.Bind<ICompanyRepository>().To<CompanyRepository>();
            kernel.Bind<IFeedbackRepository>().To<FeedbackRepository>();
            kernel.Bind<IPriceListRepository>().To<PriceListRepository>();
            kernel.Bind<IInfoCardRepository>().To<InfoCardRepository>();
            kernel.Bind<IProjectRepository>().To<ProjectRepository>();
            kernel.Bind<IProjectStepRepository>().To<ProjectStepRepository>();
            kernel.Bind<IProjectDocumentRepository>().To<ProjectDocumentRepository>();
            kernel.Bind<INewsRepository>().To<NewsRepository>();
            kernel.Bind<IDivisionRepository>().To<DivisionRepository>();

            DependencyResolver.SetResolver(new CustomDependencyResolver(kernel));
            GlobalConfiguration.Configuration.DependencyResolver =
                new NinjectWebApiResolver(kernel);
        }
    }
}