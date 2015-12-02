module Commander
  module_function
    # HOST = '10.1.10.60'
    # USER = 'makebuild'
    # PASS = ''
    def random(audio)
      if audio == "random"
        system 'bash /home/makebuild/scripts/random.sh 80'
      else
        system "bash /home/makebuild/scripts/random.sh 80 #{audio}"
      end
      # Net::SSH.start( HOST, USER, :password => PASS ) do| ssh |
      #    ssh.exec "sh /home/makebuild/scripts/random.sh"
      # end
    end
    def say(text)
      system "bash /home/makebuild/scripts/say.sh '#{text}'"
    end
end
