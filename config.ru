require File.join(File.dirname(__FILE__), 'lib/redirector')

use Rack::ContentLength
use Rack::ShowExceptions # Comment out this line if you dont want exceptions to be shown
use Debugger, false

run Redirector.new
