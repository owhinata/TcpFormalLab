# 対応表

| 概念 | C# | TLA+ | Lean |
|---|---|---|---|
| 状態 | ClientState | state | State |
| 更新 | Step | Next | step |
| Dispose の終端性 | 無効なら null | Terminal | disposed_terminal |

C#/Lean は不正操作を null/none で拒否し、TLA+ は対応する遷移を持ちません。TLA+ の stuttering は状態が変わらない抽象的なステップで、拒否された個別 API 呼び出しの表現ではありません。世代や I/O は含みません。
