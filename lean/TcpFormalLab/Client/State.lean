namespace TcpFormalLab.Client
inductive State where
  | disconnected | connecting | connected | disconnecting | disposed
  deriving DecidableEq, Repr
inductive Event where
  | connect | connected | failed | close | closed | dispose
  deriving DecidableEq, Repr

def step : State → Event → Option State
  | .disconnected, .connect => some .connecting
  | .connecting, .connected => some .connected
  | .connecting, .failed => some .disconnected
  | .connecting, .close => some .disconnecting
  | .connected, .close => some .disconnecting
  | .disconnecting, .closed => some .disconnected
  | .disposed, _ => none
  | _, .dispose => some .disposed
  | _, _ => none

theorem disposed_terminal (e : Event) : step .disposed e = none := by
  cases e <;> rfl

theorem connected_connect_rejected : step .connected .connect = none := by
  rfl
end TcpFormalLab.Client
