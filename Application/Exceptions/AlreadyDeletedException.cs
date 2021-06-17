using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class AlreadyDeletedException : Exception
    {
        public AlreadyDeletedException(int id, Type type) 
            :base($"Entity of type {type.Name} with an Id of {id} was already deleted.")
        {
        }
    }
}
