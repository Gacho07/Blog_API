using Application;
using Application.Commands.Comments;
using Application.DataTransfer;
using Application.Queries.Comment;
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
    public class CommentsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public CommentsController(UseCaseExecutor executor, IApplicationActor actor)
        {
            _executor = executor;
            _actor = actor;
        }

        // GET: api/<CommentsController>
        [HttpGet]
        public IActionResult Get([FromQuery] CommentSearch search, [FromServices] IGetCommentsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<CommentsController>/5
        [HttpGet("{id}", Name = "GetComment")]
        public IActionResult Get(int id, [FromQuery] CommentDto dto, [FromServices] IGetCommentQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<CommentsController>
        [HttpPost]
        public IActionResult Post([FromBody] InsertCommentDto dto, [FromServices] ICreateCommentCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<CommentsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] InsertCommentDto dto, [FromServices] IUpdatePersonalCommentCommand command)
        {
            dto.Id = id;
            dto.IdUser = _actor.Id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<CommentsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCommentCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }

        [HttpDelete("user/{id}")]
        public IActionResult DeletePersonalComment(int id, [FromServices] IDeletePersonalCommentCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
