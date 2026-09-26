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
        about: 'Wireless Intelligence for Embodied Autonomy'
        education: ''
        interests: ''
    design:
      biography:
        style: 'font-size: clamp(1.125rem, 1.05rem + 0.5vw, 1.375rem); line-height: 1.7;'
      background:
        gradient_mesh:
          enable: true
      name:
        size: md
      avatar:
        size: medium
        shape: circle
  - block: collection
    content:
      title: Recent Publications
      text: ''
      count: 5
      # 明示しないと「件数 > count」のときしか出ない自動表示になる
      archive:
        enable: true
        text: "すべて見る"
      filters:
        folders:
          - publications
        exclude_featured: false
      order: desc
    design:
      view: citation
      columns: '2'
  - block: collection
    id: news
    content:
      title: Recent News
      subtitle: ''
      text: ''
      page_type: news
      count: 5
      archive:
        enable: true
        text: "すべて見る"
      filters:
        author: ''
        category: ''
        tag: ''
        exclude_featured: false
        exclude_future: false
        exclude_past: false
        publication_type: ''
        folders:
          - news
      offset: 0
      order: desc
    design:
      view: card
      spacing:
        padding: [0, 0, 0, 0]
      columns: '3'
---
