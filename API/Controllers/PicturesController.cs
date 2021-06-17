using Application;
using Application.Commands.Picture;
using Application.DataTransfer;
using Application.Queries.Picture;
using Application.Searches;
using Domain;
using EFDataAccess;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PicturesController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;
        private readonly BlogContext _context;

        public PicturesController(BlogContext context, UseCaseExecutor executor, IApplicationActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/<PicturesController>
        [HttpGet]
        public IActionResult Get([FromQuery] PictureSearch dto, [FromServices] IGetPicturesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // GET api/<PicturesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<PicturesController>
        [HttpPost]
        public IActionResult Post([FromForm] UploadPictureDto dto)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Image.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "Images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Image.CopyTo(fileStream);
            }

            var picture = new Picture
            {
                ImagePath = newFileName
            };

            _context.Pictures.Add(picture);
            _context.SaveChanges();

            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<PicturesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<PicturesController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromQuery] DeletePictureDto dto, [FromServices] IDeletePictureCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }
    }
}
