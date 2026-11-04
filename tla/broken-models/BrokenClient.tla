-------------------------- MODULE BrokenClient --------------------------
EXTENDS Naturals
VARIABLES state, wasDisposed
vars == <<state, wasDisposed>>
Init == /\ state = "Disconnected" /\ wasDisposed = FALSE
Next ==
    \/ /\ state # "Disposed" /\ state' = "Disposed" /\ wasDisposed' = TRUE
    \* BUG: a late completion revives a disposed client.
    \/ /\ state = "Disposed" /\ state' = "Connected" /\ UNCHANGED wasDisposed
Spec == Init /\ [][Next]_vars
Terminal == wasDisposed => state = "Disposed"
=============================================================================
