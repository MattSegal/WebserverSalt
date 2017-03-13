# Webserver Salt Config for Nginx/Gunicorn/Django

This repo uses Salt to set up my django app on a Ubuntu VM.

### Notes

* salt-key --list-all
* salt-key --accept-all
* salt '*' test.ping

* put topfile in srv/salt
* salt 'web' state.highstate

