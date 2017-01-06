require_relative './ftp_files/version'
require_relative './ftp_files/runner'

module FtpFiles

  YAML_CONFIG = './config/ftp_files.yml'

  def self.run(host, port, user, password, passive)
    Runner.new(host, port, user, password, passive).start
  end

  def self.run(config_name)
    config = YAML.load_file(YAML_CONFIG)[config_name]
    raise 'no config' if config.nil?
    Runner.new(config['host'], config['port'], config['user'], config['password'], config['passive']).start
  end

end
