Redirector
==
A simple rack application which makes redirection of multiple domains a breeze.

Configuration
--
To configure the application all you have to do is edit the `config.yaml` file, the following is a sample configuration file:

    cosmicvent.net: # <== This is the host name of the domain which you want to redirect
      status: 302 # <== status code with which it is redirected, 302 for temporary redirects, 301 for permanent redirects
      location: 'http://cosmicvent.com' # <== the domain which it is redirected *to*
    
    
    'localhost:3030':
      status: 301
      location: 'http://cosmicvent.com:3030'
