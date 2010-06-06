require 'yaml'

class Redirector

  @@config = YAML::load(File.open('config.yaml'))

  def self.config
    @@config
  end


  def call(env)
    host_config = get_host_config(env['HTTP_HOST'])
    [host_config['status'], {'X-Directed-By' => 'redirector','Content-Type' => 'text','Location' => host_config['location']}, [get_host_response( host_config )] ]
  end

  private
  def get_host_response(host_config)
    "#{host_config['status']} moved. The document has moved to #{host_config['location']}"
  end

  def get_host_config(host)
    return @@config[host] if @@config[host]
    raise "Configuration for #{host} not available"
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
