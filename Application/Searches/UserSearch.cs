﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Username { get; set; }
        public string Email { get; set; }
    }
}
