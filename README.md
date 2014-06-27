## What is ansible-whenever? [![Build Status](https://secure.travis-ci.org/nickjj/ansible-whenever.png)](http://travis-ci.org/nickjj/ansible-whenever)

It is an [ansible](http://www.ansible.com/home) role to control the ruby gem whenever.

### What problem does it solve and why is it useful?

It's very common to run certain rake tasks in a crontab. The whenever gem allows you to write ruby code that gets executed in a crontab.

This ansible role allows you to easily update or clear tasks that you have set.

## Role variables

Below is a list of default values along with a description of what they do.

```
# The binary path for whenever.
whenever_binary_path: "{{ rails_deploy_path }}/bin/whenever"

# The path to the schedule config.
whenever_config_path: "{{ rails_deploy_path }}/config/schedule.rb"

# 0 or more whenever identifiers to update
whenever_update:
#  - myapp
#  - anotherapp

# 0 or more whenever identifiers to clear
whenever_clear:
#  - myapp
#  - anotherapp
```

## Example playbook

For the sake of this example let's assume you have a group called **app** and you have a typical `site.yml` file.

To use this role edit your `site.yml` file to look something like this:

```
---
- name: ensure app servers are configured
- hosts: app

  roles:
    # Insert other roles here to provision the server before managing whenever.
    - { role: nickjj.whenever, tags: whenever }
```

Let's say you want to edit a few defaults, you can do this by opening or creating `group_vars/all.yml` which is located relative to your `inventory` directory and then making it look something like this:

```
---
whenever_clear:
  - myapp
```

## Installation

`$ ansible-galaxy install nickjj.whenever`

## Dependencies

It depends on the [nickjj.rails](https://github.com/nickjj/ansible-rails) role. This role must be ran before whenever.

## Requirements

Tested on ubuntu 12.04 LTS but it should work on other versions that are similar.

## Example schedule config

Let's say you were using the `sitemap` gem and wanted to update your sitemap regularly.

`config/schedule.rb`:

```
every 1.day, at: '4:00 am' do
  rake 'sitemap:refresh'
end
```

## Ansible galaxy

You can find it on the official [ansible galaxy](https://galaxy.ansible.com/list#/roles/958) if you want to rate it.

## License

MIT