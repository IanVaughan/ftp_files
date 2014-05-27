require "ftp_files/version"
require 'ftp_files/runner'

module FtpFiles

  YAML_CONFIG = './config/ftp_files.yml'

  def run(host, port, user, password, passive)
    Runner.new(host, port, user, password, passive).start
  end

  def run(config_name)
    config = YAML.load_file(YAML_CONFIG)[config_name]
    Runner.new(config['host'], config['port'], config['user'], config['password'], config['passive']).start
  end

end
