require 'spec_helper'

describe FtpFiles do
  context 'passing in params' do
    subjects { FtpFiles.new(host, port, user, password, passive) }

    it 'uses params' do
      expect(subject).to be_true
    end
  end
end
