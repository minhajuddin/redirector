require 'yaml'

class Redirector

  @@config = YAML::load(File.open('config.yaml'))

  def self.config
    @@config
  end

  def get_config(host)
    return @@config[host] if @@config[host]
    raise "Configuration for #{host} not available"
  end

  def call(env)
    host_config = get_config(env['HTTP_HOST'])
    [host_config['status'], {'Content-Type' => 'text/html','Location' => host_config['location']}, '302-Found']
  end

end


class Debugger

  def initialize(app, debug)
    @app = app
    @debug = debug
  end

  def call(env)
    if @debug
      puts '==== Config information ===='
      puts Redirector.config.inspect
      puts '============================'
    end
    @app.call(env)
  end

end


