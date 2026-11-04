# 学習進捗

- 演習1: 問題提示待ち。既存の状態表・有限 TLA+ モデル・Lean の最小証明は教材として保存。学習者の理解・説明・レビューは未完了。
- 演習2〜9: 未着手。方針変更により、標準 API とアプリケーションのライフサイクル契約を中心とする。
- TCP I/O、並行制御、Server/Session、統合モデル、Liveness、refinement: 未実装・未検証。
- 既存 PR #12 には当時の C# 7 テスト成功、TLC 正常モデル成功と不正モデルの反例、Lean ビルド成功が記録されている。今回の実行結果とは区別する。

## 既存成果の分類

- A そのまま利用: .NET 10 の環境・検証スクリプト、GitHub 学習ワークフロー、既存の学習履歴。
- B 状態機械の教材として保存: ClientState / ClientMachine.Step、C# テスト、Client と BrokenClient の TLA+、Lean の State と証明、演習1の既存解答。実 TCP 実装の要求ではない。
- C 新方針へ修正: 設計・形式手法・対応表・README・演習説明・Issue の課題と依存関係。演習1の解答にあった世代番号の必須視も修正。

成果物のコードや証明は削除しない。

## 方針変更時の検証

- C#: `./scripts/test-csharp.sh` 成功（7 件）。ビルドも成功。
- TLA+: `./scripts/check-tla.sh` 成功（異なる 5 状態）。`./scripts/check-tla-broken.sh` は想定どおり `Terminal` 違反を検出。
- Lean: `./scripts/check-lean.sh` 成功。既存の純粋関数についての証明のみ。
- 初回の C# と TLC はサンドボックスのローカルソケット制限で中断し、サンドボックス外で上記のとおり再実行した。後続演習のモデルや TCP I/O は未検証。
