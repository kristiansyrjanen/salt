openssh-server:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd/sshd_config
    - template: jinja
    - context:
      port: {{ pillar['port'] }}

ssh.service:
 service.running:
    - watch:
      - file: /etc/ssh/sshd_config
