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
      username: me
    design:
      # Hugo date format
      date_format: 'January 2006'
      # Education or Experience section first?
      is_education_first: false
  - block: resume-awards
    id: awards
    content:
      title: Awards
      username: me
      field: awards
    design:
      date_format: 'January 2006'
  - block: resume-awards
    id: grants
    content:
      title: Research Grants
      username: me
      field: grants
    design:
      date_format: 'January 2006'
  - block: resume-awards
    id: fellowships
    content:
      title: Fellowships
      username: me
      field: fellowships
    design:
      date_format: 'January 2006'
  - block: resume-languages
    content:
      title: Languages
      username: me
---
