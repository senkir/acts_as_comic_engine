desc "intitialize testing environment with spork and watchr integration"
task :spork do
    fork do
      sh %{bundle exec spork}
    end    
  sh %{rake watchr}
end