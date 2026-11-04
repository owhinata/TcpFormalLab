# アーキテクチャ

TcpClient や TcpListener の内部状態と、アプリケーションのライフサイクル状態は別の概念である。後者の管理は具体的なアプリケーション要件に基づいて導入する。

## 責務と境界

- .NET は TcpClient、TcpListener、Socket、NetworkStream を提供する。契約は対象バージョンの公式資料と必要に応じてランタイムのソースで確認する。独自 TCP スタックや内部状態の複製は作らない。
- アプリケーションは要件に応じて、操作の受付、Task の追跡、Session とリソースの所有者、停止・解放の責務を定める。例えば停止完了時に管理対象 Task が残らないことは、明示的な同期と完了待ちが必要なアプリケーション契約である。
- OS やネットワークに依存する相手の生存、配信成功、I/O の完了時刻はアプリケーションだけでは保証できない。環境仮定を明記する。

`TcpClient.Connected` は最後の I/O 時点の状態を反映し、現在や次の操作時の生存を保証しない。独自の Connected フラグも正確な生存判定にはならない。読み書きの結果、例外、キャンセルや相手の終了を扱う。TCP はメッセージ境界を持たないバイトストリームであり、フレーミングは別の責務である。

`Dispose` は資源解放を要求する操作であり、アプリケーションが管理する全 Task の完了待ちとは異なる。Cancellation は協調的な要求であり完了通知ではない。Task の成功・失敗・キャンセルを観測してから停止完了を報告する契約を検討する。通信の成功は保証しない。TcpClient の Close は接続終了を要求するが、TCP の実際の終了完了通知ではない。Stream と Socket の所有関係は生成方法によって異なるため、両者の解放責任を確認する。

受付と停止の競合など、複数操作にまたがる契約を標準 API だけでは表現できない場合に限り、受付可否などの状態や同期を検討する。フラグ、ロック、世代番号は反例と要件に照らして選択し、最初から必須にしない。

TLA+ は抽象化した並行操作と順序を有限範囲・仮定の下で検査する。Lean は定義された純粋な状態更新の性質を証明する。どちらも .NET ランタイムや C# 非同期実装を自動的に証明しない。[対応表](model-implementation-map.md) を参照。

参考: [TcpClient.Connected](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.tcpclient.connected?view=net-10.0)、[TcpClient.Close](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.tcpclient.close?view=net-10.0)、[AcceptTcpClientAsync](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.tcplistener.accepttcpclientasync?view=net-10.0)、[NetworkStream.Close](https://learn.microsoft.com/en-us/dotnet/api/system.net.sockets.networkstream.close?view=net-10.0)、[.NET runtime ソース](https://github.com/dotnet/runtime/tree/main/src/libraries/System.Net.Sockets/src/System/Net/Sockets)。
