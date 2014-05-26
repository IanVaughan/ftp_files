Gem::Specification.new do |s|
  s.name        = 'ftp_files'
  s.version     = '0.0.1'
  s.date        = '2014-05-25'
  s.summary     = "List Files on a FTP site"
  s.description = "It iterates all directories, listing the files within each as it goes"
  s.authors     = ["Ian Vaughan"]
  s.email       = 'ftp_files@ianvaughan.co.uk'
  s.files       = %w{ bin/runner lib/ftp_files.rb lib/output_utils.rb lib/ext/ftp.rb config/ftp_files.yml.example }
  s.homepage    = 'https://github.com/IanVaughan/ftp_files'
  s.license     = 'MIT'
end
