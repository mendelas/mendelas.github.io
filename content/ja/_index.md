---
title: ''
summary: ''
date: 2022-10-24
type: landing

design:
  spacing: '6rem'

sections:
  - block: resume-biography-3
    content:
      username: me-ja
      text: ''
      headings:
        about: ''
        education: ''
        interests: ''
    design:
      background:
        gradient_mesh:
          enable: true
      name:
        size: md
      avatar:
        size: medium
        shape: circle
  - block: markdown
    content:
      title: '📚 研究について'
      subtitle: ''
      text: |-
        東北大学博士後期課程 Tough Robotics Lab所属．ロボットの自律移動に不可欠なSimultaneous Localization and Mapping (SLAM)の研究を主に行う．また，Integrated Sensing and Communication (ISAC)の概念に基づき，自律走行中の通信とセンシングの品質を同時に最適化する手法についての研究にも従事．自律走行中の通信品質を担保しながら，位置推定精度の向上を実現する新たな研究分野を開拓する．

        研究協力のご相談はお気軽にどうぞ

    design:
      columns: '1'
  - block: collection
    content:
      title: 最近の論文
      text: ''
      count: 5
      filters:
        folders:
          - publications
        exclude_featured: false
      order: desc
    design:
      view: citation
  - block: collection
    id: news
    content:
      title: 最近のニュース
      subtitle: ''
      text: ''
      page_type: news
      count: 5
      archive:
        enable: true
      filters:
        author: ''
        category: ''
        tag: ''
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        publication_type: ''
      offset: 0
      order: desc
    design:
      view: card
      spacing:
        padding: [0, 0, 0, 0]
---
