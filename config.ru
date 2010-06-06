require File.join(File.dirname(__FILE__), 'lib/redirector')

use Rack::ContentLength
use Debugger, false

app = proc do |env|
  app = Redirector.new()
  status, headers, response = app.call(env)
  [ status, headers, response ] 
end

run app
