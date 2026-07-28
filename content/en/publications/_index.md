---
title: Publications
cms_exclude: true
type: landing

design:
  spacing: '4rem'

# 現時点の業績は国内学会のみ。学術誌・国際学会のセクションは中身が無く
# 見出しだけが表示されてしまうため置いていない。
# 該当する業績が出たら、下と同じ collection ブロックを
# publication_type: 'article-journal' / 'paper-conference' で追加する。
# その際は content/ja/publications/_index.md も同時に直すこと。
sections:
  - block: collection
    content:
      title: Domestic Conference Papers
      filters:
        folders:
          - publications
        publication_type: 'paper-conference-domestic'
      order: desc
    design:
      view: citation
---
