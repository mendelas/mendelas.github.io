---
title: 'Experience'
date: 2023-10-24
type: landing

design:
  spacing: '5rem'

# Note: `username` refers to the user's folder name in `content/authors/`

# Page sections
sections:
  - block: resume-experience
    content:
      username: me-ja
    design:
      # Hugo date format
      date_format: '2006年1月'
      # Education or Experience section first?
      is_education_first: false
  - block: resume-awards
    id: awards
    content:
      title: Awards
      username: me-ja
      field: awards
    design:
      date_format: '2006年1月'
  - block: resume-awards
    id: grants
    content:
      title: Research Grants
      username: me-ja
      field: grants
    design:
      date_format: '2006年1月'
  - block: resume-awards
    id: fellowships
    content:
      title: Fellowships
      username: me-ja
      field: fellowships
    design:
      date_format: '2006年1月'
  - block: resume-languages
    content:
      title: Languages
      username: me-ja
---
