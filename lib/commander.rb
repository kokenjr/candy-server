module Commander
  module_function
    # HOST = '10.1.10.60'
    # USER = 'makebuild'
    # PASS = ''
    def random(audio)
      system "bash /home/makebuild/scripts/random.sh 80 #{audio}"
      # Net::SSH.start( HOST, USER, :password => PASS ) do| ssh |
      #    ssh.exec "sh /home/makebuild/scripts/random.sh"
      # end
    end
end
