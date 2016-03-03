# Helpers
helpers do
  def block(name)
    output = yield

    if build?
      output.prepend("{block:#{name}}")
      output.concat("{/block:#{name}}")
    end

    output
  end
end

# General configuration
set :tumblr_title, 'Four Nineteen'
set :tumblr_description, 'A collection by Angelo Ashmore'
set :tumblr_style_url, 'http://static.tumblr.com/p3nqrs8/WUmo3gec6/all.css'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :slim, pretty: true

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: '.tmp/dist',
  latency: 1

# Development-specific configuration
configure :development do
  activate :livereload
end
