# FtpFiles

This iterates over all the directories on a FTP site, listing the files as it goes.

## Installation

Add this line to your application's Gemfile:

    gem 'ftp_files'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ftp_files

## Usage

Run it by passing the following options in :

    FtpFiles.run(host, port, user, password, passive)

Or use the `ftp_files.yml` config to list the above options (see the .example file get started)

    FtpFiles.run('server1')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ftp_files/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
