# icinga2_plugin_centreon

Installs [centreon/centreon-plugins](https://github.com/centreon/centreon-plugins) for Nagios/icinga2.

## Usage

### icinga2_plugin_centreon::default

Just include `icinga2_plugin_centreon` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[icinga2_plugin_centreon]"
  ]
}
```

## Attributes

### Nagios Plugin Dir:

The full path to nagios's plugin dir

Default Value: 

- `/usr/lib/nagios/plugins`

Ruby usage:

```ruby
node['icinga2_plugin_centreon']['nagios']['nagios_plugin_dir'] = '/usr/lib/nagios/plugins'
```

JSON usage:

```json
{
  "icinga2_plugin_centreon": {
    "nagios": {
      "nagios_plugin_dir": "/usr/lib/nagios/plugins"
    }
  }
}
```

### Git Repo Path:

The local path to clone the plugin source

Default Value: 

- `/usr/local/src/icinga2_plugin_centreon_chef`

Ruby usage:

```ruby
node['icinga2_plugin_centreon']['git']['repo_path'] = '/usr/local/src/icinga2_plugin_centreon_chef'
```

JSON usage:

```json
{
  "icinga2_plugin_centreon": {
    "git": {
      "repo_path": "/usr/local/src/icinga2_plugin_centreon_chef"
    }
  }
}
```

### Plugin Source URL:

The git repository where this plugin's source should be pulled from

Default Value: 

- `https://github.com/centreon/centreon-plugins.git`

Ruby usage:

```ruby
node['icinga2_plugin_centreon']['git']['repo_src_url'] = 'https://github.com/centreon/centreon-plugins.git'
```

JSON usage:

```json
{
  "icinga2_plugin_centreon": {
    "git": {
      "repo_src_url": "https://github.com/centreon/centreon-plugins.git"
    }
  }
}
```

### Git Tag:

The git tag to check this plugin out to.

Default Value: 

- `20171013`

Ruby usage:

```ruby
node['icinga2_plugin_centreon']['git']['tag'] = '20171013'
```

JSON usage:

```json
{
  "icinga2_plugin_centreon": {
    "git": {
      "tag": "20171013"
    }
  }
}
```
