using Application;
using Application.Commands.Blog;
using Application.Commands.Like;
using Application.DataTransfer;
using Application.Queries.Blog;
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
    public class BlogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public BlogsController(UseCaseExecutor executor, IApplicationActor actor)
        {
            _executor = executor;
            _actor = actor;
        }

        [HttpPost]
        [Route("/api/like")]
        public IActionResult Like([FromBody] LikeDto request, [FromServices] ILikeBlogCommand command)
        {
            string json = System.Text.Json.JsonSerializer.Serialize(request);
            request.IdUser = _actor.Id;
            _executor.ExecuteCommand(command, request);
            return StatusCode(StatusCodes.Status201Created);
        }

        // GET: api/<BlogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] BlogSearch dto, [FromServices] IGetBlogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }


        // GET api/<BlogsController>/5
        [HttpGet("{id}", Name = "GetBlog")]
        //[Route("/api/GetBlog/{id}")]
        public IActionResult Get(int id, [FromServices] IGetBlogQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<BlogsController>
        [HttpPost]
        public IActionResult Post([FromBody] InsertBlogDto dto, [FromServices] ICreateBlogCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<BlogsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateBlogDto dto, [FromServices] IUpdateBlogCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<BlogsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteBlogCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
