# mountain-sediment-da

山地流域の流砂量推定とデータ同化検討のための作業用リポジトリです。

## Structure

- `docs/`
  - 全体アーキテクチャ、論文化に向けた整理メモ、図表対応表
- `thesis/`
  - 原稿、図、表、論文メモ
- `hydrophone-gp/`
  - ハイドロフォン観測に基づく流砂量推定モデル
- `simhis-external/`
  - 外部の `simhis` 実行系とやり取りするための受け渡し領域
- `legacy/`
  - 旧 `placeholder` から退避した生データ・旧成果物の保管場所

## Design Principles

- 推定モデルと論文資料は同じリポジトリで管理する
- `simhis` 本体はこのリポジトリに同梱しない
- `simhis` との連携はファイル契約ベースで疎結合に保つ
- 旧データは保管するが、Git 追跡対象からは外す
