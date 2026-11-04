# TLA+ ガイド
`Init` は初期状態、`Next` は原子的な次状態、`Spec` はそれらの振る舞いです。`Terminal` は不変条件です。`./scripts/check-tla.sh` は正常モデル、`./scripts/check-tla-broken.sh` は意図的なバグを検査します。不正モデルの反例: 1. Disconnected で開始。2. Dispose が発生し Disposed になる。3. 遅延した完了通知が Connected に戻してしまい、終端性に違反します。このモデルは競合の具体的実装を示すものではありません。
