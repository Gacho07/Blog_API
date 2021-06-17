using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.User
{
    public interface IGetUserQuery : IQuery<SingleUserDto, int>
    {
    }
}
