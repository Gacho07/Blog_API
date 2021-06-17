using Application;
using Domain;
using EFDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Logging
{
    public class EFDatabaseLogger : IUseCaseLogger
    {
        private readonly BlogContext _context;

        public EFDatabaseLogger(BlogContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object data)
        {
            _context.UseCaseLogs.Add(new UseCaseLog
            {
                Date = DateTime.UtcNow,
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(data),
                UseCaseName = useCase.Name.ToString()
            });

            _context.SaveChanges();
        }
    }
}
