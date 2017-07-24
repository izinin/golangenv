{% set home = salt.pillar.get('workdir') %}
{% set workdir = salt.pillar.get('gowsdir') %}
{% set source_code_dir = salt.pillar.get('projsources') %}

common dependecies:
  pkg.installed:
    - skip_verify: True
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs: 
      - build-essential
      - curl
      - git

Download glide:
  file.managed:
    - source: https://github.com/Masterminds/glide/releases/download/v0.12.3/glide-v0.12.3-linux-amd64.tar.gz
    - name: /tmp/glide-v0.12.3-linux-amd64.tar.gz
    - source_hash: sha256=0e2be5e863464610ebc420443ccfab15cdfdf1c4ab63b5eb25d1216900a75109

Install glide:
  cmd.run:
    - name: |
        tar -xzf /tmp/glide-v0.12.3-linux-amd64.tar.gz -C /tmp/ &&
        mv /tmp/linux-amd64/glide /usr/local/bin/

golang:
  cmd.run:
    - env:
      - GOPATH: {{home}}/{{workdir}}
    - name: |
            curl https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz | tar -C /usr/local -xz &&
            git config --global url."git@$REPO_BASE:".insteadOf "https://$REPO_BASE/"
