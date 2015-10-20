# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved
# title: Windows Audit & Logging Configuration

rule "windows-rdp-100" do
  impact 1.0
  title "Windows Remote Desktop Configured to Always Prompt for Password"
  describe group_policy("Windows Components\\Remote Desktop Services\\Remote Desktop Session Host\\Security") do
    its("Always prompt for password upon connection") { should eq 1 }
  end
end

rule "windows-rdp-101" do
  impact 1.0
  title "Strong Encryption for Windows Remote Desktop Required"
  describe group_policy("Windows Components\\Remote Desktop Services\\Remote Desktop Session Host\\Security") do
    its("Set client connection encryption level") { should eq 3 }
  end
end
