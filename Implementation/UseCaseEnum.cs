using System;

namespace Implementation
{
    public enum UseCaseEnum
    {
        EFRegisterUserCommand = 1,

        EFCreateCategoryCommand = 2,
        EFUpdateCategoryCommand = 3,
        EFDeleteCategoryCommand = 4,
        EFGetOneCategoryQuery = 5,
        EDGetCategoriesQuery = 6,
    
        EFCreateBlogCommand = 7,
        EFUpdateBlogCommand = 8,
        EFDeleteBlogCommand = 9,
        EFGetOneBlogQuery = 10, 
        EFGetBlogsQuery = 11,  

        EFCreateUserCommand = 12,
        EFUpdateUserCommand = 13,
        EFDeleteUserCommand = 14,
        EFGetOneUserQuery = 15,
        EFGetUsersQuery = 16,

        EFCreateCommentCommand = 17, 
        EFDeleteCommentCommand = 18,
        EFGetOneCommentQuery = 19, 
        EFGetCommentsQuery = 20,

        EFDeletePictureCommand = 21,
        EFGetPicturesQuery = 22,

        EFGetUseCaseLogQuery = 23, 

        EFLikeBlog = 24, 

        EFUpdatePersonalBlogCommand = 25, 
        EFDeletePersonalBlogCommand = 26, 

        EFUpdatePeronsalCommentCommand = 27, 
        EFDeletePersonalCommentCommand = 28,        
    }
}
