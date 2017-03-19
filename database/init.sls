# sudo -u postgres psql
postgresql:
  pkg:
    - name: postgresql
    - installed
  service.running:
        - require:
            - pkg: postgresql
        - watch:
            - pkg: postgresql

# internal port only

user_django:
  postgres_user:
    - present
    - name: django
    - password: password
    - login: True
    - user: postgres
    - require:
      - service: postgresql

database_links:
  postgres_database:
    - present
    - name: links
    - owner: django
    - encoding: UTF8
    - lc_collate: en_US.UTF-8
    - lc_ctype: en_US.UTF-8
    - user: postgres
    - require:
      - postgres_user: user_django
