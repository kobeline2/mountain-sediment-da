# simhis External Interface

`simhis` はこのリポジトリの外で実行する前提とし、
連携はファイル単位で行います。

## Export Side

`exports/scenario-packages/` には、外部実行者へ渡す入力パッケージを置きます。

想定内容:

- ケース ID
- 対象期間
- 土砂供給シナリオ
- 使用した観測由来入力の出典
- 実行時に必要な補足メモ

`exports/observation-products/` には、観測から作った入力補助資料を置きます。

想定内容:

- 流砂量推定結果
- 時系列 CSV / XLSX
- 図表確認用の PNG

## Import Side

`imports/run-metadata/` には、外部実行の条件と結果概要を置きます。

想定内容:

- 実行者
- 実行日
- 使用した `simhis` バージョン
- 実行環境
- 備考

`imports/selected-results/` には、論文や比較に必要な結果のみを置きます。

想定内容:

- 累積流砂量
- 代表断面の時系列
- 比較用に絞った結果ファイル

## Separation Rule

- `hydrophone-gp/` は `simhis` 本体に依存しない
- `simhis-external/` は `simhis` 実行コードを持たない
- 受け渡しは、将来別の実行者が見ても分かるメタデータ付きファイルで行う
