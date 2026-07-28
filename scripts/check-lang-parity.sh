#!/usr/bin/env bash
# 日本語版(content/ja)と英語版(content/en)の対応漏れを検出する。
# 使い方: ./scripts/check-lang-parity.sh
# 終了コード: 0 = ズレなし / 1 = ズレあり
set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
report() { fail=1; printf '%s\n' "$1"; }

# --- 1. ページの対応 ------------------------------------------------------
# authors/ は taxonomy 設定専用なので除外しない（両方に必要）。
list_pages() { find "content/$1" -name '*.md' -printf '%P\n' | sort; }

only_ja=$(comm -23 <(list_pages ja) <(list_pages en))
only_en=$(comm -13 <(list_pages ja) <(list_pages en))

[ -n "$only_ja" ] && report "[NG] 日本語のみ存在（英語版が未作成）:
$(sed 's/^/      content\/ja\//' <<<"$only_ja")"
[ -n "$only_en" ] && report "[NG] 英語のみ存在（日本語版が未作成）:
$(sed 's/^/      content\/en\//' <<<"$only_en")"

# --- 2. ページバンドル内の添付ファイルの対応 ------------------------------
# featured.* は言語ごとに別画像でも良いので拡張子を落として比較する
# （存在の有無だけを見る）。それ以外は本文から参照されるためファイル名まで一致必須。
list_assets() {
  find "content/$1" -type f ! -name '*.md' -printf '%P\n' \
    | sed 's#/featured\.[A-Za-z0-9]\+$#/featured.*#' | sort
}

only_ja_a=$(comm -23 <(list_assets ja) <(list_assets en))
only_en_a=$(comm -13 <(list_assets ja) <(list_assets en))

[ -n "$only_ja_a" ] && report "[NG] 添付ファイルが日本語側のみ:
$(sed 's/^/      content\/ja\//' <<<"$only_ja_a")"
[ -n "$only_en_a" ] && report "[NG] 添付ファイルが英語側のみ:
$(sed 's/^/      content\/en\//' <<<"$only_en_a")"

# --- 3. 対応ページ間で一致すべき front matter ------------------------------
# date / publishDate / publication_types / featured は言語で変わらない。
# ズレると一覧の並び順やセクション振り分けが日英で食い違う。
fm() { sed -n "/^$2:/{s/^$2:[[:space:]]*//;p;q}" "$1"; }

while read -r rel; do
  ja="content/ja/$rel"; en="content/en/$rel"
  [ -f "$ja" ] && [ -f "$en" ] || continue
  for key in date publishDate publication_types featured weight; do
    a=$(fm "$ja" "$key"); b=$(fm "$en" "$key")
    [ "$a" = "$b" ] || report "[NG] $rel : '$key' が不一致 (ja=${a:-未設定} / en=${b:-未設定})"
  done
done < <(list_pages ja)

# --- 4. 著者プロフィールの参照先 -------------------------------------------
# content/ja/** は me-ja、content/en/** は me を参照する。
bad_ja=$(grep -rln '^  - me$' content/ja --include='*.md' || true)
[ -n "$bad_ja" ] && report "[NG] 日本語ページが author 'me' を参照（'me-ja' であるべき）:
$(sed 's/^/      /' <<<"$bad_ja")"
bad_en=$(grep -rln '^  - me-ja$' content/en --include='*.md' || true)
[ -n "$bad_en" ] && report "[NG] 英語ページが author 'me-ja' を参照（'me' であるべき）:
$(sed 's/^/      /' <<<"$bad_en")"

# --- 5. i18n オーバーライドのキー対応 --------------------------------------
i18n_keys() { grep -oE '^[a-z_]+:' "i18n/$1.yaml" 2>/dev/null | tr -d ':' | sort; }
only_ja_k=$(comm -23 <(i18n_keys ja) <(i18n_keys en))
only_en_k=$(comm -13 <(i18n_keys ja) <(i18n_keys en))
# 片側だけのキーはモジュール既定値にフォールバックするので即エラーではない。
# モジュール側に適切な英語訳がある場合（read_more 等）は ja のみで正しい。
# 独自に追加した文言が片側だけになっていないかを目視確認するための情報出力。
[ -n "$only_ja_k" ] && printf '[情報] ja のみ上書き（en はモジュール既定値）: %s\n' "$(tr '\n' ' ' <<<"$only_ja_k")"
[ -n "$only_en_k" ] && printf '[情報] en のみ上書き（ja はモジュール既定値）: %s\n' "$(tr '\n' ' ' <<<"$only_en_k")"

# --- 6. 削除済みショートコード ---------------------------------------------
# tweet/twitter/twitter_simple は Hugo 0.156.0 で削除済み。使うとビルドが落ちる。
dead=$(grep -rln '{{<[[:space:]]*\(tweet\|twitter\|twitter_simple\)[[:space:]]' content --include='*.md' || true)
[ -n "$dead" ] && report "[NG] 削除済みショートコード tweet/twitter を使用（'x' に置換すること）:
$(sed 's/^/      /' <<<"$dead")"

if [ "$fail" -eq 0 ]; then
  echo "[OK] 日英の対応にズレはありません。"
else
  echo
  echo "日英どちらかだけを更新していないか確認してください。"
fi
exit "$fail"
