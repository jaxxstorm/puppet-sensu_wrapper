# puppet-cron

[![Build Status](https://travis-ci.org/jaxxstorm/puppet-cron.svg?branch=master)](https://travis-ci.org/jaxxstorm/puppet-cron)

## Description

This is yet another puppet-cron module. It will set up cron (by installed the package and making sure the service is running) and also includes a defined type which will put cron jobs in `/etc/cron.d`

This module has some similarities to Yelp's [puppet-cron](https://github.com/Yelp/puppet-cron) with the intention of being much simpler while still providing some of the cool stuff in that module

## Example

```puppet
cron::job { 'example':
  minute  => '*',
  user    => 'root',
  command => '/bin/true',
}
```
