using Application;
using Application.Commands.Category;
using Application.DataTransfer;
using Application.Queries;
using Application.Queries.Category;
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
    public class CategoriesController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public CategoriesController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearch search, [FromServices] IGetCategoriesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<CategoriesController>/5
        [HttpGet("{id}", Name = "GetCat")]
        public IActionResult Get(int id, [FromServices] IGetCategoryQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<CategoriesController>
        [HttpPost]
        public IActionResult Post([FromBody] CategoryDto dto, [FromServices] ICreateCategoryCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<CategoriesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CategoryDto dto, [FromServices] IUpdateCategoryCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<CategoriesController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
