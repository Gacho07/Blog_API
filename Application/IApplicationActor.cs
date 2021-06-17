using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{ 
    // A user that we will later implement using a JWT
    public interface IApplicationActor
    {
        int Id { get; }
        string Identity { get; }
        IEnumerable<int> AllowedUseCases { get; }
    }
}
