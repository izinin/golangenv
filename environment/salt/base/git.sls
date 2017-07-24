#This is git and ruby runtime environment dependecies
common dependecies:
  pkg.installed:
    - refresh: True
    - allow_updates: True
    - pkgs: 
      - curl
      - git
      - build-essential ## gcc compiler
      - libssl-dev
      - libreadline-dev
      - zlib1g-dev
      - coreutils
      - bzip2

