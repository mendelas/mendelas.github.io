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
      username: me
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
        私は東北大学の博士課程学生であり，Tough Robotics Lab のメンバーとして，自律移動に不可欠な Simultaneous Localization and Mapping（SLAM）を研究しています。自律走行中の通信は安全上の理由から途絶させないことが基本とされていますが，現実環境でこれを達成することは極めて困難です。そこで私は，Integrated Sensing and Communication（ISAC）の概念に基づき，ロボットの自己位置推定精度と通信品質を同時に最適化する手法の開発に取り組んでいます。

        研究協力のご相談はお気軽にどうぞ 😃

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
  - block: markdown
    content:
      title: ""
      text: |
        <div style="text-align:right; margin-top:-1rem;">
        <a href="/ja/publications/" style="display:inline-flex;align-items:center;gap:0.4rem;font-weight:600;font-size:0.9rem;color:var(--color-primary-600);text-decoration:none;border-bottom:2px solid currentColor;padding-bottom:2px;">論文一覧 →</a>
        </div>
    design:
      columns: '1'
  - block: collection
    id: news
    content:
      title: 最近のニュース
      subtitle: ''
      text: ''
      page_type: blog
      count: 5
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
  - block: markdown
    content:
      title: ""
      text: |
        <div style="text-align:right; margin-top:-1rem;">
        <a href="/ja/blog/" style="display:inline-flex;align-items:center;gap:0.4rem;font-weight:600;font-size:0.9rem;color:var(--color-primary-600);text-decoration:none;border-bottom:2px solid currentColor;padding-bottom:2px;">ニュース一覧 →</a>
        </div>
    design:
      columns: '1'
---
