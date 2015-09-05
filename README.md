Simple vagrant nginx+node+mongo base box
========================================

* Simple vagrant box with nginx as a reverse proxy server (load balancing, ssl) for two node instances.
* Using [forever](https://github.com/foreverjs/forever) to keep node in sync with local changes.
* Forwards box port 4000 (nginx) to host 7777, mongo 27017 to host 17017
* Can be used as a template for simple nginx+node+mongo setup

# Getting Started
```
vagrant up

# test nginx->node connection
curl --insecure https://127.0.0.1:7777

# test direct access to mongo
$ mongo 127.0.0.1:17017 --eval "JSON.stringify(db.stats())"
```

License
-------
MIT License
