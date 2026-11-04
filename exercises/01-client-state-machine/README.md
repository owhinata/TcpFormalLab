# EX-01: 標準 TcpClient とアプリケーション状態の違い

## 学習目標
TcpClient と Socket の責務、Connected の限界、アプリケーション状態、TLA+ の状態と Action、Lean の単純な遷移を学ぶ。

## 課題
既存 ClientState の各状態が具体的なアプリケーション要件に必要か考え、既存 C#・TLA+・Lean 教材の対応と限界を説明する。独自ラッパーは要求しない。

## 検証と境界
対象とする C# テスト、TLC、Lean を演習時に選び、仮定と未検証範囲を記録する。抽象モデルは .NET や C# 実装自体の証明ではない。

既存教材: [状態表](../../src/TcpFormalLab.Core/Client/ClientMachine.cs)、[TLA+](../../tla/client/Client.tla)、[Lean](../../lean/TcpFormalLab/Client/State.lean)、[既存解答](answer.md)（考えた後に参照）。
