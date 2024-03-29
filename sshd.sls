openssh-server:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshdemon/sshd_config

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
