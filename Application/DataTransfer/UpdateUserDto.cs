﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UpdateUserDto
    {
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Username { get; set; }
		public string Password { get; set; }
		public List<int> UserUseCases { get; set; }
	}
}
