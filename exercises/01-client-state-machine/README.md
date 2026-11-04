# 演習1: Client の状態遷移

## 学習目標
状態、イベント、許可された遷移と拒否を区別する。

## 前提知識
C# の enum と関数。TCP 接続の実装経験は不要です。

## 問題
初期状態は `Disconnected` です。`Connect`、`Connected`、`Close`、`Closed`、`Dispose` をこの順に適用したとき、各操作直後の状態を書いてください。さらに最後に `Connect` を適用するとどうなるか、理由とともに答えてください。`ClientMachine.Step` は許可しない操作に `null` を返します。

## 実行方法
`./scripts/test-csharp.sh`、`./scripts/check-tla.sh`、`./scripts/check-tla-broken.sh`、`./scripts/check-lean.sh` を実行します。状態表は `src/TcpFormalLab.Core/Client/ClientMachine.cs` にあります。

## 期待結果
テストと正常モデルと Lean が成功し、不正モデルは `Terminal` 違反の反例を出します。解答前に下記ファイルを開く必要はありません。

## ヒント
必要になったら一段ずつ開いてください。
<details><summary>ヒント1</summary>各操作で状態表の現在の状態に合う行を探します。</details>
<details><summary>ヒント2</summary>Dispose の後のすべての操作を調べてください。</details>

## 解答と解説
[解答を見る](answer.md)（自分で考えてから開いてください）。

## 発展課題
`Connecting` 中に `Close` が来た場合を追跡してください。遅延した接続完了の識別には何が不足していますか。
