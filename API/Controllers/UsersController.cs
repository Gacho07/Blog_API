using Application;
using Application.Commands.User;
using Application.DataTransfer;
using Application.Queries.User;
using Application.Searches;
using Microsoft.AspNetCore.Http;
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
    public class UsersController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UsersController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UsersController>
        [HttpGet]
        public IActionResult Get([FromServices] IGetUsersQuery query, [FromQuery] UserSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}", Name = "GetUser")]
        public IActionResult Get(int id, [FromServices] IGetUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<UsersController>
        [HttpPost]
        public IActionResult Post([FromBody] InsertUserDto dto, [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateUserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
