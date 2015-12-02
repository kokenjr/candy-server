module Commander
  module_function
    # HOST = '10.1.10.60'
    # USER = 'makebuild'
    # PASS = ''
    def random(audio)
      bash_command = 'bash /home/makebuild/scripts/random.sh 80'
      if audio == "random"
        puts "bash_command: #{bash_command}"
        system bash_command
      else
        bash_command += " #{audio}"
        puts "bash_command: #{bash_command}"
        system bash_command
      end
      # Net::SSH.start( HOST, USER, :password => PASS ) do| ssh |
      #    ssh.exec "sh /home/makebuild/scripts/random.sh"
      # end
    end
    def say(text)
      bash_command = "bash /home/makebuild/scripts/say.sh '#{text.gsub("'", "\'")}'"
      puts "bash_command: #{bash_command}"
      system bash_command
    end
end
