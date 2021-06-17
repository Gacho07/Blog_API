using Application;
using Application.Commands.Blog;
using Application.DataTransfer;
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
    public class FrontendBlogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public FrontendBlogsController(UseCaseExecutor executor, IApplicationActor actor)
        {
            _executor = executor;
            _actor = actor;
        }

        // PUT api/<FrontendBlogsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateBlogDto dto, [FromServices] IUpdatePersonalBlogCommand command)
        {
            dto.IdUser = _actor.Id;
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<FrontendBlogsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePersonalBlogCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
