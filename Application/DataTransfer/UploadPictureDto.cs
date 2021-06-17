using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UploadPictureDto 
    {
        public IFormFile Image { get; set; }
    }
}
