python-pip:
  pkg.installed

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

gunicorn:
  pip.installed:
    - require:
      - pkg: python-pip

app_root:
  file.directory:
    - name: /var/webapps/links/app
    - user: www-data
    - makedirs: True

app_venv:
  virtualenv.managed:
    - name: /var/webapps/links
    - require:
      - file: app_root
      - pip: virtualenv

gunicorn_log:
  file.touch:
    - name: /var/webapps/links/gunicorn.log  
    - require:
      - file: app_root

gunicorn_start:
  file.managed:
    - name: /var/webapps/links/bin/gunicorn_start
    - source: salt://django/gunicorn_start
    - mode: 755

gunicorn_stop:
  file.managed:
    - name: /var/webapps/links/bin/gunicorn_stop
    - source: salt://django/gunicorn_stop
    - mode: 755

