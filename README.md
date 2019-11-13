andrewrothstein.terragrunt
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-terragrunt.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-terragrunt)

Installs [terragrunt](https://github.com/gruntwork-io/terragrunt).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.terragrunt
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
