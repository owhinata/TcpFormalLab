----------------------------- MODULE Client -----------------------------
EXTENDS Naturals
VARIABLES state, wasDisposed
vars == <<state, wasDisposed>>
States == {"Disconnected", "Connecting", "Connected", "Disconnecting", "Disposed"}
Init == /\ state = "Disconnected" /\ wasDisposed = FALSE
Next ==
    \/ /\ state = "Disconnected" /\ state' = "Connecting" /\ UNCHANGED wasDisposed
    \/ /\ state = "Connecting" /\ state' \in {"Connected", "Disconnected", "Disconnecting"} /\ UNCHANGED wasDisposed
    \/ /\ state = "Connected" /\ state' = "Disconnecting" /\ UNCHANGED wasDisposed
    \/ /\ state = "Disconnecting" /\ state' = "Disconnected" /\ UNCHANGED wasDisposed
    \/ /\ state # "Disposed" /\ state' = "Disposed" /\ wasDisposed' = TRUE
Spec == Init /\ [][Next]_vars
TypeOK == /\ state \in States /\ wasDisposed \in BOOLEAN
Terminal == wasDisposed => state = "Disposed"
=============================================================================
