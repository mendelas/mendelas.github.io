---
# Leave the homepage title empty to use the site title
title: ''
summary: ''
date: 2022-10-24
type: landing

design:
  # Default section spacing
  spacing: '6rem'

sections:
  - block: resume-biography-3
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: me
      text: ''
      headings:
        about: 'Wireless Intelligence for Embodied Autonomy'
        education: ''
        interests: ''
    design:
      # Bio text a notch above the block default (text-lg), scaling with the viewport
      biography:
        style: 'font-size: clamp(1.125rem, 1.05rem + 0.5vw, 1.375rem); line-height: 1.7;'
      # Use the new Gradient Mesh which automatically adapts to the selected theme colors
      background:
        gradient_mesh:
          enable: true

      # Name heading sizing to accommodate long or short names
      name:
        size: md # Options: xs, sm, md, lg (default), xl

      # Avatar customization
      avatar:
        size: medium # Options: small (150px), medium (200px, default), large (320px), xl (400px), xxl (500px)
        shape: circle # Options: circle (default), square, rounded
  - block: collection
    content:
      title: Recent Publications
      text: ''
      count: 5
      # 明示しないと「件数 > count」のときしか出ない自動表示になる
      archive:
        enable: true
        text: "See all"
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
        text: "See all"
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
