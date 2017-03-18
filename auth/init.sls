jenkins_auth:
  ssh_auth.present:
    - user: root
    - source: salt://auth/jenkins.pub
    - config: '%h/.ssh/authorized_keys'

sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://auth/sshd_config
    - mode: 644