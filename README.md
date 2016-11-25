# puppet-sensu_wrapper

[![Build Status](https://travis-ci.org/jaxxstorm/sensu-wrapper.svg?branch=master)](https://travis-ci.org/jaxxstorm/sensu-wrapper)

#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with puppet-sensu_wrapper](#setup)
    * [What puppet-sensu_wrapper affects](#what-puppet-sensu_wrapper-affects)
    * [Beginning with puppet-sensu_wrapper](#beginning-with-puppet-sensu_wrapper)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


## Module description

This module will set up and install [sensu-wrapper](https://github.com/jaxxstorm/sensu-wrapper), a tool designed to run arbitrary commands and return the result to sensu.

This will:

  - Download the golang binary for Linux, and install it for you (by default in `/usr/local/bin`)

## Setup

### What puppet-cron affects

  * puppet-sensu_wrapper simply downloads the binary for sensu_wrapper using the [puppet-archive](https://github.com/voxpupuli/puppet-archive) module and make it available to run 

### Beginning with puppet-cron

Simply include the module like so:

```puppet
  include ::sensu_wrapper
```

You may want to use a class include if you wish to override parameters:

```puppet
  class { '::sensu_wrapper' :
    version => 'v0.2',
  }
```

## Usage

### I just want to manage sensu_wrapper, what's the minimum I need

```puppet
  include ::sensu_wrapper
```

### I want to download from a custom URL

If you need to pull the binary from a local HTTP repository rather than github, you'll need to specify a URL like so:

```puppet
  class { '::sensu_wrapper':
    download_url => 'http://my-http-server/sensu_wrapper/v0.2/sensu_wrapper.tar.gz,
    version      => 'v0.2',
  }
```

** Please note, you should still set the version to ensure the symlink/directories and upgrades work **


## Reference

### Classes

#### Public Classes
  * [`sensu_wrapper`](#sensu_wrapper): Installs sensu_wrapper in your environment.

#### Private Classes
  * [`sensu_wrapper::install`]: Installs the required sensu_wrapper binary and symlinks to a path of your choice
  * [`sensu_wrapper::configure`]: Configures sensu_wrapper's required config dir
  

### `sensu_wrapper`

#### Parameters

##### `version` [String]

The version of the sensu-wrapper to deploy, see https://github.com/jaxxstorm/sensu-wrapper/releases

##### `archive_path` [String]

Full path to store the tar gzip archive of the sensu wrapper (default: /tmp/sensu-wrapper.tar.gz)

##### `extract_path` [String]

Where to extract the downloaded sensu_wrapper tar gzip archive (default: `/opt/sensu-wrapper`)

##### `bin_dir` [String]

The bin to symlink the executable (default: `/usr/local/bin/sensu-wrapper`)

##### `config_dir` [String]

Config directory for sensu_wrapper (default: `/etc/sensu-wrapper.d`)

##### `download_url_base` [String]

Base URL from github release for grabbing sensu-wrapper binary (default: `https://github.com/jaxxstorm/sensu-wrapper/releases/download/'`)

#### `download_url` [String]

Override URL for downloading sensu-wrapper (default: undef)

## Limitations

  - Only works on Linux, like the sensu-wrapper binary
