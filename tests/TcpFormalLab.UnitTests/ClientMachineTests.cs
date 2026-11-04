using TcpFormalLab.Core.Client;
using Xunit;

namespace TcpFormalLab.UnitTests;
public class ClientMachineTests
{
    [Theory(Timeout = 5000)]
    [InlineData(ClientState.Disconnected, ClientEvent.Connect, ClientState.Connecting)]
    [InlineData(ClientState.Connecting, ClientEvent.Connected, ClientState.Connected)]
    [InlineData(ClientState.Connecting, ClientEvent.Failed, ClientState.Disconnected)]
    [InlineData(ClientState.Connecting, ClientEvent.Close, ClientState.Disconnecting)]
    [InlineData(ClientState.Connected, ClientEvent.Close, ClientState.Disconnecting)]
    [InlineData(ClientState.Disconnecting, ClientEvent.Closed, ClientState.Disconnected)]
    public Task ValidTransitions(ClientState state, ClientEvent action, ClientState expected)
    {
        Assert.Equal(expected, ClientMachine.Step(state, action));
        return Task.CompletedTask;
    }

    [Fact(Timeout = 5000)]
    public Task DisposeIsTerminalAndInvalidEventsAreRejected()
    {
        foreach (var action in Enum.GetValues<ClientEvent>())
            Assert.Null(ClientMachine.Step(ClientState.Disposed, action));
        Assert.Null(ClientMachine.Step(ClientState.Connected, ClientEvent.Connect));
        foreach (var state in Enum.GetValues<ClientState>().Where(s => s != ClientState.Disposed))
            Assert.Equal(ClientState.Disposed, ClientMachine.Step(state, ClientEvent.Dispose));
        return Task.CompletedTask;
    }
}
