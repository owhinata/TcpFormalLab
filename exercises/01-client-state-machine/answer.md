# 演習1の解答

Connecting → Connected → Disconnecting → Disconnected → Disposed。最後の Connect は null で拒否されます。Disposed から出る規則がないためです。TLA+ では該当遷移が存在せず、Lean では `disposed_terminal` が全イベントを場合分けします。実 TCP 操作は扱いません。遅延完了の扱いは具体的な契約次第です。再試行を識別する必要がある場合は世代番号も選択肢ですが、必須とは限りません。
