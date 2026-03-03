---
title: 論文
cms_exclude: true
type: landing

design:
  spacing: '4rem'

sections:
  - block: collection
    content:
      title: 学術誌論文
      filters:
        folders:
          - publications
        publication_type: 'article-journal'
      order: desc
    design:
      view: citation

  - block: collection
    content:
      title: 国際学会
      filters:
        folders:
          - publications
        publication_type: 'paper-conference'
      order: desc
    design:
      view: citation

  - block: collection
    content:
      title: 国内学会
      filters:
        folders:
          - publications
        publication_type: 'paper-conference-domestic'
      order: desc
    design:
      view: citation
---
