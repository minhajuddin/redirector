require 'yaml'

class Redirector

  @@config = YAML::load(File.open('config.yaml'))

  def get_config(host)
    return @@config[host] unless @@config[host]
    raise "Configuration for #{host} not available"
  end

  def call(env)
    host_config = get_config(env['HTTP_HOST'])
    puts host_config
    [host_config['status'], {'Content-Type' => 'text/html','Location' => host_config['location']}, '302-Found']
  end

end
