# hydrophone-gp

ハイドロフォン観測データから流砂量と不確実性を推定するための解析領域です。

## Canonical Source

この領域で今後整理していく推定モデルの正本は、
旧作業領域にあった `修論データ/ガウス過程計算/2023_mt_ks` です。

この判断は、当時この部分を実装していた作成者確認に基づいています。
そのため、旧版やコピー群ではなく、まず `2023_mt_ks` を基準に
移植・整理・再構成を進めます。

## Current Layout

- `main.m`
  - 実行入口
- `init.m`
  - MATLAB パス設定と GPML 初期化
- `configs/`
  - ローカルパス設定と実行パラメータ
- `vendor/gpml/`
  - 依存として同梱した GPML toolbox
- `src/`
  - 前処理、モデル、後処理、補助関数
- `data/raw/`
  - 元 Excel データ
- `data/processed/`
  - MAT 化・前処理済みデータ
- `models/trained/`
  - 学習済みハイパーパラメータと正規化情報
- `outputs/predictions/`
  - 推定結果 Excel
- `outputs/figures/`
  - 図

## Runtime Files

実行時には次の 2 ファイルを使います。

- `configs/local_paths.m`
  - GPML などローカル環境依存の設定
- `configs/parameters.m`
  - 学習/予測対象や入出力パスの設定

`local_paths.m` と `parameters.m` は Git 追跡対象から外してあり、
サンプルは `configs/*.sample.m` として管理します。
未作成でも sample にフォールバックするので、初回起動は sample のまま可能です。

また、`data/`, `models/trained/`, `outputs/` には、
正本 `2023_mt_ks` から複製した作業用データを配置済みです。

想定する責務は次の通りです。

- 入力データの整理
- 前処理
- モデル学習
- 予測
- 図表用出力の生成

`simhis` とは直接結合せず、必要に応じてファイル出力を
`simhis-external/exports/` に渡す前提にします。

## How To Run

1. `configs/local_paths.m` を確認する
2. `configs/parameters.m` を確認する
3. MATLAB で `hydrophone-gp/main.m` を実行する

`main.m` は内部で `init.m` を呼ぶので、
基本的には `main.m` だけ実行すれば動く想定です。

## Excel Conversion

`ipsdataExcel2mat.m` は project root 側のものを正規入口とします。

- パルス列だけの Excel:
  - `ipsdataExcel2mat('input.xlsx', 'output.mat')`
- `Qs`, `Ds` を含む整形済み Excel:
  - `ipsdataExcel2mat('input.xlsx', 'output.mat', 'measured')`

`init.m` は project root も MATLAB path に追加するので、
この入口関数をそのまま呼べます。
