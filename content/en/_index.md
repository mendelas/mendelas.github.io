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
        about: ''
        education: ''
        interests: ''
    design:
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
  - block: markdown
    content:
      title: '📚 My Research'
      subtitle: ''
      text: |-
        I am a PhD student at Tohoku University as a member of the Tough Robotics Lab. My research focuses on Simultaneous Localization and Mapping (SLAM) essential for autonomous driving. Communication generally remains uninterrupted during autonomous driving for safety reasons. However, achieving this in real-world environments is extremely challenging. Therefore, based on the concept of Integrated Sensing and Communication (ISAC), I am developing a method to simultaneously optimize both the accuracy of a robot's self-localization and the quality of its communication.

        Please reach out to collaborate 😃

    design:
      columns: '1'
  - block: collection
    content:
      title: Recent Publications
      text: ''
      count: 5
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
