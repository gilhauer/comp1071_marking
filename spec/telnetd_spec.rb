describe package('telnetd') do
  it { should be_installed }
end

describe inetd_conf do
  its("telnet") { should_not eq nil }
end