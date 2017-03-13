jenkins_auth:
  ssh_auth.present:
    - source: salt://auth/jenkins.pub
    - config: '%h/.ssh/authorized_keys'
    - user: root