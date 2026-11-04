# 演習1の解答

Connecting → Connected → Disconnecting → Disconnected → Disposed。最後の Connect は null で拒否されます。Disposed から出る規則がないためです。TLA+ では該当遷移が存在せず、Lean では `disposed_terminal` が全イベントを場合分けします。実 TCP 操作は扱いません。発展課題では接続試行の世代番号が必要です。
