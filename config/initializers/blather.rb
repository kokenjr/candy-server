bash_command = "bash vendor/blather/language_updater.sh"
puts "bash_command: #{bash_command}"
system bash_command
bash_command = "vendor/blather/Blather.py m 1 -i g -c"
puts "bash_command: #{bash_command}"
system bash_command
