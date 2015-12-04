module Commander
  module_function
    # HOST = '10.1.10.60'
    # USER = 'makebuild'
    # PASS = ''
    def random(audio)
      bash_command = 'bash script/random.sh 80'
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
      prefix = text.split.first
      if prefix != "es"
        text = "en " + text
      end
      bash_command = "bash script/say.sh \"#{text}\""
      puts "bash_command: #{bash_command}"
      system bash_command
    end
    def status(state)
      bash_command = "bash script/#{state}.sh"
      puts "bash_command: #{bash_command}"
      system bash_command
    end
end
