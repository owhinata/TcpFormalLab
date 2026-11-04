# TcpFormalLab

.NET 10、TLA+、Lean 4 を使う日本語の段階的学習プロジェクトです。現在の完成範囲は **演習1の純粋な Client 状態遷移**です。TCP 通信、サーバー、セッション、競合処理、演習2以降は未実装です。

Ubuntu、Git、curl、Java 11 以降、.NET SDK 10.0.114 が必要です。SDK は `global.json` で固定しています。公式の現行 SDK は 10.0.403 ですが、この環境にある 10.0.114 を再現用に固定しており、更新時は global.json と検証を併せて変更します。

```bash
./scripts/setup.sh       # 公式リリースを .tools に取得
./scripts/check-env.sh
./scripts/test-csharp.sh
./scripts/check-tla.sh   # 正常モデル
./scripts/check-tla-broken.sh # 意図的な不正モデルの反例
./scripts/check-lean.sh
./scripts/check-all.sh
```

.NET の NuGet 復元にはネットワークまたは該当バージョンのキャッシュが必要です。`setup.sh` は Linux x86_64 用 elan 4.2.4、Lean 4.35.0、TLC 1.7.2 を固定し、elan は公式 SHA-256、TLC は公式 SHA-1 で照合します。取得には公式サイトへの接続が必要です。

[演習1](exercises/01-client-state-machine/README.md) から開始してください。解答は別ファイルです。進捗と範囲は [学習進捗](docs/learning-progress.md) を参照してください。

## GitHub を使った学習

演習ごとに Issue を開き、依存する演習を確認してから Codex に番号を指定します。作業ブランチは `exercise/<issue-number>-<short-name>`、成果物はそのブランチへコミットします。検証結果は成功・失敗・未実施を区別して Issue に記録し、PR の本文に `Closes #<issue-number>` と検証結果・学習内容・未解決事項を記載します。学習者のレビューと承認が終わるまでは PR をマージせず、Issue を Close しません。状態ラベルは原則一つだけ付けます。

| 演習 | GitHub Issue | 依存 |
|---|---|---|
| EX-01 Client 状態遷移 | [#1](https://github.com/owhinata/TcpFormalLab/issues/1) | なし |
| EX-02 Connect/Close | [#2](https://github.com/owhinata/TcpFormalLab/issues/2) | EX-01 |
| EX-03 Server 状態遷移 | [#3](https://github.com/owhinata/TcpFormalLab/issues/3) | EX-01 |
| EX-04 Accept/Stop | [#4](https://github.com/owhinata/TcpFormalLab/issues/4) | EX-02、EX-03 |
| EX-05 Session | [#5](https://github.com/owhinata/TcpFormalLab/issues/5) | EX-03 |
| EX-06 複数 Client | [#6](https://github.com/owhinata/TcpFormalLab/issues/6) | EX-04、EX-05 |
| EX-07 統合モデル | [#7](https://github.com/owhinata/TcpFormalLab/issues/7) | EX-02、EX-04〜06 |
| EX-08 Safety/Liveness | [#8](https://github.com/owhinata/TcpFormalLab/issues/8) | EX-07 |
| EX-09 Refinement | [#9](https://github.com/owhinata/TcpFormalLab/issues/9) | EX-07、EX-08 |

環境構築の確認は [#10](https://github.com/owhinata/TcpFormalLab/issues/10)、CI の GitHub 上での確認は [#11](https://github.com/owhinata/TcpFormalLab/issues/11) です。Issue Forms、PR テンプレート、Actions はこれらのファイルを GitHub に反映した後に利用できます。

CI は main への push と PR で C#、正常 TLA+ モデル、Lean を検証します。意図的な不正モデルは通常の CI から分離し `./scripts/check-tla-broken.sh` で検証します。

学習用の GitHub Project は [TcpFormalLab Learning](https://github.com/users/owhinata/projects/7) です。[Board ビュー](https://github.com/users/owhinata/projects/7/views/2) で Issue を管理できます。Project は非公開で、Project の Status と Issue の `status:*` ラベルは自動連携しないため、それぞれ更新してください。
