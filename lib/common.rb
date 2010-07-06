gem 'json'
gem 'choice'
gem 'rest-client'

require 'restclient'
require 'yaml'

module Common
  def common_options
    header ''
    header 'Common options:'

    option :server_url, :required => true do
      short '-s'
      long '--server=URL'
      desc 'The CouchDB server to compact databases on. Required'
    end
  
    option :config_file do
      short "-c"
      long "--config=CONFIG"
      desc "path to YAML config file containing username/password. (see couch_conf_example.yml)"
    end  
  
    option :username do
      short '-u'
      long '--username=USERNAME'
      desc 'Username to connect to CouchDB to run compaction as (ignored if config option provided)'
    end
  
    option :password do
      short '-p'
      long '--password=PASSWORD'
      desc 'Password to connect to CouchDB to run compaction as (ignored if config option provided)'
    end

    option :help do
      long '--help'
      desc 'Show this message'
    end
  end
  
  def server_url
    Choice.choices[:server_url]
  end
  
  def username
    if Choice.choices[:config_file]
      config["username"]
    else
      Choice.choices[:username]
    end
  end
  
  def password
    if Choice.choices[:config_file]
      config["password"]
    else
      Choice.choices[:password]
    end
  end
  
  def config
    @config ||= YAML.load(File.read(Choice.choices[:config_file]))
  end
  
  def couch_request(url, method = :get, payload = nil)
    req = {:url => url, :method => method}
    req[:user] = username if username
    req[:password] = password if password
    req[:payload] = payload if payload
    RestClient::Request.execute(req)
  end  
end