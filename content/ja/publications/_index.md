---
title: 論文
cms_exclude: true
type: landing

design:
  spacing: '4rem'

# 現時点の業績は国内学会のみ。学術誌・国際学会のセクションは中身が無く
# 見出しだけが表示されてしまうため置いていない。
# 該当する業績が出たら、下と同じ collection ブロックを
# publication_type: 'article-journal' / 'paper-conference' で追加する。
# その際は content/en/publications/_index.md も同時に直すこと。
sections:
  - block: collection
    content:
      title: 国内学会
      # 0 = 全件表示。省略すると既定値 5 になり、6件目以降が黙って隠れる。
      count: 0
      filters:
        folders:
          - publications
        publication_type: 'paper-conference-domestic'
      order: desc
    design:
      view: citation
---
