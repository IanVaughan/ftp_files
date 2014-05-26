require 'net/ftp'
require_relative 'ext/ftp_makepasv'

class FtpFiles

  class << self
    def run(host, port, user, password, passive)
      self.new(host, port, user, password, passive).start
    end
  end

  # File listings can have a timestamp of either a time or year
  # And the filename can have numbers in
  # drwxrwxrwx   1 admin    users            4096 Nov 20  2013 Live Comedy
  # drwxrwxrwx   1 admin    users            4096 Nov 20  2013 Ben 10 Uni
  # drwxrwxrwx   1 admin    users            4096 Jan 30 20:54 Software 10 fo
  FILENAME_REGEX = /^.*([0-9]{4}|[0-9]{2}:[0-9]{2}) (.*)/

  def initialize(host, port, user, password, passive)
    @ftp = Net::FTP.new
    @ftp.passive = passive
    @ftp.connect host, port
    @ftp.login user, password

    @spaces = 0
  end

  def start
    get_files
    @ftp.close
  end

  private

  def extract_names file_array
    file_array.map { |file| file.gsub(FILENAME_REGEX, '\2') }
  end

  def extract_file_names file_array
    extract_names file_array.select { |file| !(file.match(/^d/)) }
  end

  def extract_dirs_names file_array
    extract_names file_array.select { |file| !!(file.match(/^d/)) }
  end

  def puts args
    super (' ' * @spaces) + args
  end

  def list files
    with_indent do
      files.each { |f| puts f }
    end
  end

  def with_indent &block
    raise unless block_given?
    @spaces += 2
    yield
    @spaces -= 2
  end

  def get_files
    with_indent do
      puts "#{File.basename @ftp.pwd}"
      list = @ftp.list
      dirs = extract_dirs_names list
      files = extract_file_names list
      list files
      dirs.each do |f|
        begin
          @ftp.chdir(f)
          get_files
        rescue Net::FTPPermError => e
          puts "ERROR: Could not open #{e}"
        end
      end
      @ftp.chdir('..')
    end
  end
end
