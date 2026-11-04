namespace TcpFormalLab.Core.Client;

public enum ClientState { Disconnected, Connecting, Connected, Disconnecting, Disposed }
public enum ClientEvent { Connect, Connected, Failed, Close, Closed, Dispose }

/// <summary>A pure transition table; null denotes an invalid event.</summary>
public static class ClientMachine
{
    public static ClientState? Step(ClientState state, ClientEvent action) => (state, action) switch
    {
        (ClientState.Disconnected, ClientEvent.Connect) => ClientState.Connecting,
        (ClientState.Connecting, ClientEvent.Connected) => ClientState.Connected,
        (ClientState.Connecting, ClientEvent.Failed) => ClientState.Disconnected,
        (ClientState.Connecting or ClientState.Connected, ClientEvent.Close) => ClientState.Disconnecting,
        (ClientState.Disconnecting, ClientEvent.Closed) => ClientState.Disconnected,
        (not ClientState.Disposed, ClientEvent.Dispose) => ClientState.Disposed,
        _ => null
    };
}
