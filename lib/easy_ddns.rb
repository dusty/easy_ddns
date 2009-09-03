require 'net/http'
require 'open-uri'
require 'yaml'
class EasyDdns
  VERSION = '0.0.1'
  attr_reader :config
  def self.update
    ddns = EasyDdns.new
    ddns.update
  end
  def initialize
    check_config
    @config = YAML::load(File.open('/etc/ddns.yml'))
  end
  def private_ip
    self.send_request('http://169.254.169.254/latest/meta-data/local-ipv4')
  end
  def public_ip
    self.send_request('http://169.254.169.254/latest/meta-data/public-ipv4')
  end
  def update
    self.config['hosts'].each do |host|
      self.update_host(
        host['name'],
        host['id'],
        host['username'],
        host['password'],
        get_ip(host)
      )
    end
    true
  end
  def update_host(name,id,user,pass,ip)
    url  = 'http://www.dnsmadeeasy.com/servlet/updateip'
    url += "?username=#{user}&password=#{pass}"
    url += "&id=#{id}&ip=#{ip}"
    begin
      response = self.send_request(url)
      puts "#{name} : #{response}"
    rescue Exception => e
      puts "#{name} : #{e.message}"
    end
  end
  protected
  def get_ip(host)
    ip = case host['type']
    when 'private'
      self.private_ip
    when 'public'
      self.public_ip
    end
  end
  def send_request(url)
    ip = Net::HTTP.get_response(URI.parse(url))
    ip.value
    ip.body
  end
  def check_config
    unless File.exists?('/etc/ddns.yml')
      puts <<-EOD
\n\n** Configuration file /etc/ddns.yml does not exist
** Please create a file named ddns.yml in /etc, and include
** your DDNS settings for dnsmadeeasy.

# example /etc/ddns.yml
hosts:
 - name: tmp1.yourhost.net
   id: 3333333
   password: xxxxx
   username: xxxxx
   type: public
 - name: tmp1.int.yourhost.net
   id: 4444444
   password: xxxxx
   username: xxxxx
   type: private\n\n
EOD
      exit(1)
    end
  end
end