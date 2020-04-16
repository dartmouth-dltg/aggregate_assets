# Aggregate CSS & JS

An ArchivesSpace plugin that provides a template for aggregating all css and js
in the frontend/assets directory of the plugin. It does not provide minification,
it just aggregates all of the css and js files into two aggregate files that are named
`#{plugin_name}-#{some_secure_random_hex}.css` and 
`#{plugin_name}-#{some_secure_random_hex}.js`

These two aggregates are removed and regenerated on startup of the application.

All of the good stuff is in `frontend/plugin_init.rb` and 
`views/layout_head.html.erb`

## How to install it

This is intended to be more of a template than an actual plugin.
To test it out, install as usual.

Download and unpack the latest release of the plugin into your
ArchivesSpace plugins directory:

```
    $ curl ...
    $ cd /path/to/archivesspace/plugins
    $ unzip ...
```

Add the plugin name to the list of enabled plugins in `config/config.rb`:

```
AppConfig[:plugins] = ['local','aggregate_assets']
```
Place some css and js files in the `frontend/assets` directory. Startup
the app as normal.