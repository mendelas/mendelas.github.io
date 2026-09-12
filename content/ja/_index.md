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
        東北大学博士後期課程 Tough Robotics Lab所属．**ロボティクス，無線インテリジェンス，Physical AI**の交点を研究領域とし，複雑な実環境でも信頼して動作する自律システムの構築を目指している．

        とくに関心があるのは，**無線通信とセンシングをロボット知能の外側にある支援技術として扱うのではなく，知能そのものを構成する一部として位置づける**という視点である．**無線センシング，Integrated Sensing and Communication (ISAC)，自律ロボティクス，自動化**にまたがるテーマに取り組んでいる．

        最終的には，**物理世界を認識し，通信し，推論し，行動する身体性を持つ自律システム**の実現を目指している．

        **ロボティクス，無線インテリジェンス，Physical AIにご関心のある方は，ぜひ共同研究のご相談を．**

    design:
      columns: '1'
  - block: collection
    content:
      title: 最近の論文
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
      title: 最近のニュース
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
