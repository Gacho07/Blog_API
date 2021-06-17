using API.Core;
using Application.DataTransfer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokensController : ControllerBase
    {
        private readonly JWTManager _manager;

        public TokensController(JWTManager manager)
        {
            _manager = manager;
        }

        // POST api/<TokensController>
 
        [HttpPost]
        public IActionResult Post([FromBody] LoginDto request)
        {
            var token = _manager.MakeToken(request.Username, request.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new
            {
                token
            });
        }
    }
}
