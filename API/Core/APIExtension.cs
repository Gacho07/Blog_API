using Application;
using Application.Commands.Blog;
using Application.Commands.Category;
using Application.Commands.Comments;
using Application.Commands.Like;
using Application.Commands.Picture;
using Application.Commands.User;
using Application.Queries;
using Application.Queries.Blog;
using Application.Queries.Category;
using Application.Queries.Comment;
using Application.Queries.Picture;
using Application.Queries.User;
using Implementation.Commands;
using Implementation.Commands.Blog;
using Implementation.Commands.Category;
using Implementation.Commands.Comment;
using Implementation.Commands.Like;
using Implementation.Commands.Picutre;
using Implementation.Commands.User;
using Implementation.Comment;
using Implementation.Queries;
using Implementation.Queries.Blog;
using Implementation.Queries.Category;
using Implementation.Queries.Comment;
using Implementation.Queries.Picture;
using Implementation.Queries.User;
using Implementation.Validators.Blog;
using Implementation.Validators.Category;
using Implementation.Validators.Comment;
using Implementation.Validators.Like;
using Implementation.Validators.Picture;
using Implementation.Validators.User;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API.Core
{
    public static class APIExtension
    {
        public static void LoadUseCases(this IServiceCollection services)
        {
            services.AddTransient<UseCaseExecutor>();

            // Commands
            services.AddTransient<IRegisterUserCommand, EFRegisterUserCommand>();

            services.AddTransient<ICreateCategoryCommand, EFCreateCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EFUpdateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EFDeleteCategoryCommand>();

            services.AddTransient<ICreateBlogCommand, EFCreateBlogCommand>();
            services.AddTransient<IUpdateBlogCommand, EFUpdateBlogCommand>();
            services.AddTransient<IDeleteBlogCommand, EFDeleteBlogCommand>();

            services.AddTransient<IDeletePictureCommand, EFDeletePictureCommand>();

            services.AddTransient<ILikeBlogCommand, EFLikeBlogCommand>();

            services.AddTransient<ICreateCommentCommand, EFCreateCommentCommand>();
            services.AddTransient<IDeleteCommentCommand, EFDeleteCommentCommand>();

            services.AddTransient<ICreateUserCommand, EFCreateUserCommand>();
            services.AddTransient<IUpdateUserCommand, EFUpdateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EFDeleteUserCommand>();

            services.AddTransient<IUpdatePersonalBlogCommand, EFUpdatePersonalBlogCommand>();
            services.AddTransient<IDeletePersonalBlogCommand, EFDeletePersonalBlogCommand>();

            services.AddTransient<IUpdatePersonalCommentCommand, EFUpdatePersonalCommentCommand>();
            services.AddTransient<IDeletePersonalCommentCommand, EFDeletePersonalCommentCommand>();

            // Queries
            services.AddTransient<IGetCategoriesQuery, EFGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EFGetCategoryQuery>();

            services.AddTransient<IGetPicturesQuery, EFGetPicturesQuery>();

            services.AddTransient<IGetBlogQuery, EFGetBlogQuery>();
            services.AddTransient<IGetBlogsQuery, EFGetBlogsQuery>();

            services.AddTransient<IGetUseCaseLogsQuery, EFGetUseCaseLogsQuery>();

            services.AddTransient<IGetUserQuery, EFGetUserQuery>();
            services.AddTransient<IGetUsersQuery, EFGetUsersQuery>();

            services.AddTransient<IGetCommentQuery, EFGetCommentQuery>();
            services.AddTransient<IGetCommentsQuery, EFGetCommentsQuery>(); 


            // Validators
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<DeleteCategoryValidator>();
            services.AddTransient<CreateBlogValidator>();
            services.AddTransient<UpdateBlogValidator>();
            services.AddTransient<DeleteBlogValidator>();
            services.AddTransient<DeletePictureValidator>();
            services.AddTransient<LikeValidator>();
            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<UpdateCommentValidator>();
            services.AddTransient<DeleteCommentValidator>();
         
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnnonymusActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JWTActor>(actorString);

                return actor;
            });
        }


        public static void AddJWT(this IServiceCollection services)
        {
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }


    }
}
