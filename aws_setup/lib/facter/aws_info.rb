ENV["NO_PROXY"] ||= '127.0.0.1, localhost, 169.254.169.254'

region = Facter.value('region')
instanceid = Facter.value('instanceid')
%x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | grep "TAGS" | awk '{ print $2 " " $3 " " $4}'| tr [:upper:] [:lower:] > /etc/tags }.chomp

# Create the fact from the EC2 Name tag
Facter.add('tag_name') do
  setcode do
    %x{/bin/egrep -iw "Name" /etc/tags | /bin/awk '{ print $2 }'}.chomp
  end
end

# Creates and populates the AWS region fact
Facter.add('region') do
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/curl -sf http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" \'{print $4}\'')
  end
end

# Creates and populates the instanceid fact
Facter.add('instancetype') do
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/curl -sf http://169.254.169.254/latest/meta-data/instance-type;echo ""')
   end
end

# Creates and populates the instanceid fact
Facter.add('instanceid') do
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/curl -sf http://169.254.169.254/latest/meta-data/instance-id;echo ""')
   end
end

# Creates a fact which displays the version of the awscli
Facter.add('awscliver') do
  setcode do
    `/usr/bin/aws --version 2>&1`[/aws-cli\/([^ ]+) /, 1]
  end
end
