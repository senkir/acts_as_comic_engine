desc "Run watchr"
task :watchr do
  sh %{bundle exec watchr specs.watchr.rb }
end