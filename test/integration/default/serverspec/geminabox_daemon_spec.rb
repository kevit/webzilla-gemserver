require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
    c.before :all do
          c.path = '/sbin:/usr/sbin'
            end
end

describe "geminabox service" do

    it "is listening on port 9010" do
          expect(port(9010)).to be_listening
    end

    it "has a running service geminabox " do
          expect(service("geminabox")).to be_running
    end

end

describe file('/opt/repos') do
    it { should be_directory }
end

describe command('ls /opt/repos/testgem/*.gem') do
    it { should return_stdout /testgem\-0\.0\.1\.gem/ }
end



