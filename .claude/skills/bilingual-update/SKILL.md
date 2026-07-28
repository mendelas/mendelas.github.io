---
name: bilingual-update
description: このサイトのコンテンツ（お知らせ・業績・プロジェクト・経歴・プロフィール・メニュー）を追加・更新・削除するときに使う。content/en と content/ja を必ず1:1で同時に更新し、ビルドと日英ズレ検査を通すまでを行う。「論文を追加」「ニュースを書いて」「経歴を更新」「英語版が無い」等で起動する。
---

# 日英同時更新

`content/en/`（英語・既定言語）と `content/ja/`（日本語）は **ファイル単位で1:1に対応**
していなければならない。片方だけ更新すると、ビルドは通るのに公開サイトが壊れる。

**片方だけ更新して終わりにしない。** ユーザーが日本語でしか情報をくれなくても、
英訳して英語版も作る。逆も同じ。

---

## 手順

### 1. 対応するファイルを両言語分そろえる

同じ **slug（ディレクトリ名）** で両方に置く。slug は英語の小文字ケバブケースにする
（日本語ディレクトリ名は URL が壊れるので使わない）。

```
content/en/publications/<slug>/index.md
content/ja/publications/<slug>/index.md
```

画像などの添付ファイルも両方のディレクトリに置く。本文から `{{< figure src="..." >}}` で
参照するファイルは **同じファイル名**にする。`featured.*` だけは言語ごとに別画像でも良い。

### 2. 言語で「変える」ものと「揃える」もの

| 揃える（一致必須） | 変える（翻訳する） |
| --- | --- |
| `date`, `publishDate` | `title`, `summary`, `abstract` |
| `publication_types` | 本文 |
| `featured`, `weight` | `tags`（英語版は英語、日本語版は日本語） |
| slug / 添付ファイル名 | 共著者名（日本語表記 ↔ ローマ字表記） |
| `links` の URL | `publication`（学会名の正式英語名） |

`date` がずれると一覧の並び順が日英で食い違う。`publication_types` がずれると
業績ページで別のセクションに入る。

### 3. 著者の指定

- `content/en/**` → `authors: [me]`
- `content/ja/**` → `authors: [me-ja]`

`data/authors/me.yaml` と `me-ja.yaml` に解決される。
プロフィール（学歴・職歴・スキル・受賞）を直すときは **この2ファイルを同時に**直し、
項目の数と順序を対応させる。

### 4. セクション定義・メニューも両言語

コンテンツを足すだけでは足りない場合がある。

- 業績の新しい種別 → `content/en/publications/_index.md` と
  `content/ja/publications/_index.md` の両方に collection ブロックを追加
- ナビ項目 → `config/_default/menus.yaml` と `config/_default/menus.ja.yaml` の両方
- 新しい UI 文言 → `i18n/en.yaml` と `i18n/ja.yaml` の両方

### 5. 検査する（必須）

```bash
./scripts/check-lang-parity.sh
```

検出内容: 片言語にしか無いページ／添付ファイル、揃えるべき front matter の不一致、
著者参照の取り違え（ja で `me`、en で `me-ja`）、削除済みショートコードの使用。
`[NG]` がゼロになるまで直す。

### 6. ビルドを通す（必須）

**ビルドが落ちると GitHub Actions のデプロイが走らず、サイトは古いまま公開され続ける。**
push 前に必ずローカルで通す。

```bash
hugo --minify --printI18nWarnings 2>&1 | grep -v '^WARN  Template'
```

- `ERROR` が出ていないこと
- `MISSING_TRANSLATION` が出ていないこと
- サマリ表の `Pages` が EN / JA でほぼ同数であること（大きく開いていたら片言語の作り忘れ）

`WARN Template ... is unused` はモジュール由来のノイズなので無視してよい。

Hugo/Node が入っていない環境なら、Hugo extended 0.156.0（`hugoblox.yaml` で固定）、
Node 20、Go を用意する。Go は Hugo モジュールの取得に必要。

---

## 落とし穴

- **`{{< tweet >}}` は Hugo 0.156.0 で削除済み。** `{{< x user="..." id="..." >}}` を使う。
  使うとビルドが落ちる。
- **front matter を `<!-- ---` でコメントアウトして下書きにしない。** タイトル空の壊れた
  ページが公開される。不要ならファイルごと消す。
- **`paper-conference-domestic` は CSL 標準外の独自型。** 表示名は `i18n/{en,ja}.yaml` の
  `pub_paper_conference_domestic` で定義している。独自型を増やしたら両方に足す。
- **`tags` を日英で共通にしない。** taxonomy が言語ごとに分かれるので、
  日本語版は日本語タグ、英語版は英語タグにする。

---

## 翻訳の方針

- 国内学会の論文でも、英語版には **英訳したタイトル**と**学会の正式英語名**を書く。
  正式英語名が確認できない場合は推測で埋めず、ユーザーに確認する。
- 共著者名のローマ字表記が不確かな場合も推測で確定させず、確認事項として報告する。
- 固有名詞（研究室名・機関名・衛星名）は各組織の公式英語表記に合わせる。
