using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class UnauthorizedUserAccessException : Exception
    {
        public UnauthorizedUserAccessException(IApplicationActor actor, string UseCaseName)
            :base ($"User with identity: {actor.Identity} with id: {actor.Id} has tried to execute Use Case {UseCaseName}")
        {

        }
    }
}
