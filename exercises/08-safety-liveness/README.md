# EX-08: Safety と Liveness

## 学習目標
Safety、Liveness、Fairness、Deadlock、Starvation、Timeout を区別する。

## 課題
終了済み対象への登録禁止、カウンター整合性、完了時の Task 不在を safety として検討する。終了要求の処理と、実行中操作が終了すれば Shutdown が完了することを liveness として、必要な公平性・環境仮定を明示する。I/O の無条件完了を仮定しない。

## 検証と境界
対象とする C# テスト、TLC、Lean を演習時に選び、仮定と未検証範囲を記録する。抽象モデルは .NET や C# 実装自体の証明ではない。

教材・モデル・解答は未着手。学習者の回答を待って段階的に進めます。
