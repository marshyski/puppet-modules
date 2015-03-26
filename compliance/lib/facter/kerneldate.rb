# Get the update date of lastest kernel 

Facter.add('kerneldate') do
  setcode do
    %x{/bin/rpm -qa --last | grep ^kernel-[0-9] | head -1 | awk '{ print $3$4$5 }'}.chomp
  end
end
