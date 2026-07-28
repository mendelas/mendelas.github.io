# CLAUDE.md

Hugo Blox の `academic-cv` テンプレートをベースにした Hugo 製の静的サイト。
`main` への push で GitHub Pages に自動デプロイされる。

サイト名・公開URL・プロフィール等の値は `config/_default/params.yaml`、
`config/_default/hugo.yaml`、`data/authors/` にある。このファイルには転記しない。

---

## 最重要ルール: 日本語と英語は必ず同時に更新する

このサイトは **英語（既定・`/`）と日本語（`/ja/`）の完全な二言語構成**。
`content/en/` と `content/ja/` は **ファイル単位で1:1に対応していなければならない**。

片方だけを更新すると、もう一方の言語で

- ページが存在せず言語切替が 404 になる
- 業績一覧に論文が出てこない
- 一覧の並び順が日英で食い違う

といった、ビルドは通るのに公開サイトが壊れる不具合になる。

**コンテンツを触ったら必ず最後に実行する:**

```bash
./scripts/check-lang-parity.sh
```

詳しい手順は `.claude/skills/bilingual-update/SKILL.md`（`/bilingual-update`）にある。
記事の追加・更新・削除を頼まれたらこのスキルを使うこと。

---

## ディレクトリ構成

```
content/en/          英語版（既定言語。URL は / 直下）
content/ja/          日本語版（URL は /ja/ 配下）
  _index.md            トップページ（ブロック構成）
  experience.md        経歴ページ
  news/                お知らせ（ページバンドル）
  projects/            プロジェクト紹介
  publications/        業績
  authors/_index.md    authors taxonomy を出力しない設定のみ。中身は空でよい
data/authors/
  me.yaml              英語版プロフィール（略歴・学歴・職歴・スキル・受賞）
  me-ja.yaml           日本語版プロフィール（me.yaml と項目を対応させる）
config/_default/
  hugo.yaml            Hugo 本体設定
  languages.yaml       en / ja の contentDir 定義
  menus.yaml           英語ナビ
  menus.ja.yaml        日本語ナビ（両方を同時に直す）
  params.yaml          Hugo Blox のテーマ・SEO 等
i18n/en.yaml           英語 UI 文言の上書き
i18n/ja.yaml           日本語 UI 文言の上書き
layouts/_partials/hbx/blocks/resume-experience/block.html
                       logo 対応のため上書きした Hugo Blox ブロック。
                       置き場所については「既知の落とし穴」を参照
scripts/check-lang-parity.sh
                       日英のズレ検出（コンテンツ変更後に必ず実行）
```

テーマ本体は Hugo モジュール（`config/_default/module.yaml`）として取得されるので
リポジトリ内には無い。ブロックの実装を確認したいときは
`~/.cache/hugo_cache/modules/filecache/modules/pkg/mod/github.com/!hugo!blox/kit/modules/blox@*/`
を読む。

---

## ビルドとプレビュー

必要なもの: Hugo **extended** 0.156.0（`hugoblox.yaml` の `hugo_version` で固定）、
Node.js 20、Go（Hugo モジュール取得に必要）。

```bash
pnpm install        # 初回のみ（Tailwind 等）
pnpm run dev        # http://localhost:1313 でプレビュー
pnpm run build      # 本番ビルド + Pagefind 検索インデックス生成
```

CI は `.github/workflows/build.yml` で `hugo --minify` を実行する。
**ビルドが落ちるとデプロイ自体が行われず、サイトは古いまま**なので、
push 前にローカルでビルドを通しておくこと。

エラーだけを見たいとき:

```bash
hugo --minify --printI18nWarnings 2>&1 | grep -v '^WARN  Template'
```

`WARN Template ... is unused` はモジュール由来の大量ノイズなので無視してよい。

---

## 業績（publications）の書き方

`content/{en,ja}/publications/<slug>/index.md` を **同じ slug** で両言語に置く。

`publication_types` は CSL 標準の型に加えて、独自型 `paper-conference-domestic`
（国内学会）を使っている。

| publication_types | 掲載先セクション |
| --- | --- |
| `article-journal` | Journal Articles / 学術誌論文 |
| `paper-conference` | International Conference Papers / 国際学会 |
| `paper-conference-domestic` | Domestic Conference Papers / 国内学会 |

独自型のため表示名は Hugo Blox モジュールに無い。`i18n/en.yaml` と `i18n/ja.yaml` の
`pub_paper_conference_domestic` で定義している。**新しい独自型を足すときは
両方の i18n ファイルに追加する**（片方だけだとその言語で
`MISSING_TRANSLATION` 警告とキー名の直接表示になる）。

セクションの定義自体は `content/en/publications/_index.md` と
`content/ja/publications/_index.md` の両方にあるので、
種別を増やすときは **_index.md も両言語**を直す。

### 著者名

- `content/en/**` では `me`、`content/ja/**` では `me-ja` を指定する。
  これが `data/authors/me.yaml` / `me-ja.yaml` に解決される。
- 共著者は文字列で直接書く。日本語版は日本語表記、英語版はローマ字表記。

---

## 既知の落とし穴

- **`{{< tweet >}}` は使えない。** Hugo 0.156.0 で `twitter` / `tweet` /
  `twitter_simple` ショートコードは削除された。`{{< x user="..." id="..." >}}` を使う。
  使うとビルドが `error building site` で落ちる。
- **front matter を `<!-- ---` でコメントアウトしない。** Hugo は front matter 無しの
  ページとして扱い、タイトル空でコメント内容がそのまま本文に出るページを公開してしまう。
  不要なページはファイルごと削除する。
- **`date` / `publishDate` / `publication_types` / `featured` は日英で必ず一致させる。**
  ずれると一覧の並び順やセクション振り分けが言語間で食い違う。
- **メニューは `menus.yaml` と `menus.ja.yaml` の2ファイル。** 項目を足すなら両方に足す。
  リンク先のページが両言語に存在することも確認する。
- **ブロックの上書きは `layouts/_partials/hbx/blocks/<ブロック名>/block.html` に置く。**
  `layouts/blox/<ブロック名>/block.html` は Hugo の探索対象外で、**エラーも警告も出ないまま
  黙って無視される**。実際にこれで `logo` 対応の上書きが長期間効いておらず、
  `data/authors/*.yaml` の `logo:` が無視されていた。
  上書きが効いているか確かめるには、ファイル先頭に一時的にコメントを入れてビルドし、
  出力 HTML に現れるかを見る。
- **経歴ページのロゴは `static/media/logos/` に置く。** 上書きブロックが
  `/media/logos/<ファイル名>` という絶対パスで参照するため、`assets/` 側に置いても使われない。
