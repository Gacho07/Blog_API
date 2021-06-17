﻿using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Category
{
    public class EFGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly BlogContext _context;

        public EFGetCategoriesQuery(BlogContext context)
        {
            _context = context;
        }

        public int Id => (int)UseCaseEnum.EDGetCategoriesQuery;

        public string Name => UseCaseEnum.EDGetCategoriesQuery.ToString();

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            query = query.Where(x => x.IsActive == true);

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<CategoryDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new CategoryDto
                {
                    Id = x.Id,
                    Name = x.Name
                }).ToList()
            };

            return response;
        }
    }
}
