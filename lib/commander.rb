module Commander
  module_function
    # HOST = '10.1.10.60'
    # USER = 'makebuild'
    # PASS = ''
    def random(audio)
      audio = audio.strip.downcase.gsub(" ", "-")
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
    def say_random_things
      sentence = nil
      File.foreach("script/random_dict.txt").each_with_index do |line, number|
        sentence = line if rand < 1.0/(number+1)
      end
      say(sentence.gsub("\"", "").strip)
    end
    def say(text)
      text = text.gsub(/\r/," ").gsub(/\n/," ").strip.downcase
      prefix = text.split.first
      if prefix == "es"
        text = text.split.drop(1).join(' ')
      else
        prefix = "en"
      end
      bash_command = "bash script/say.sh #{prefix} \"#{text}\""
      run_command(bash_command)
    end
    def status(state)
      state = state.downcase
      bash_command = "bash script/#{state}.sh"
      run_command(bash_command)
    end
    def restart_blather
      Thread.new do
        bash_command = "pidof python2 ./Blather.py | awk '{print \"kill -9 \" $1}' | sh"
        run_command(bash_command)
        bash_command = "cd vendor/blather/ && ./Blather.py m 1 -i g -c"
        run_command(bash_command)
      end
    end
    def run_command(bash_command)
      puts "bash_command: #{bash_command}"
      system bash_command
    end
    def get_sound_commands
      commands = []
      directory = "public/sounds"
      Dir.entries(directory).each do |file|
        is_directory = File.directory? File.join(directory, file)
        if is_directory && file != "." && file != ".."
          commands << file
        end
      end

      commands
    end
end
