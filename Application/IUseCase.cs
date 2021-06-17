using System;

namespace Application
{
    // For Logging every command or query / reducing code in Controllers
    // For authorization where with one Id in one place for each possible application in the system we check
    // whether the currently logged in user is allowed or not to execute the command.
    public interface IUseCase
    {
        int Id { get; }
        string Name { get; }
    }

    // Command always change system, doesn't return anything back

    // <TRequest> generic parameter defines which of the data is necessary to be able to execute the command
    // indicates the class or type of data
    public interface ICommand<TRequest> : IUseCase
    {
        void Execute(TRequest request);
    }

    // Doesn't change anyting in system, we return something to client through system
    public interface IQuery<TResponse, TSearch> : IUseCase
    {
        TResponse Execute(TSearch search);
    }

}
