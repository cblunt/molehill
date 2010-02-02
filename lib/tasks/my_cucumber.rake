vendored_cucumber_bin = Dir["#{RAILS_ROOT}/vendor/{gems,plugins}/cucumber*/bin/cucumber"].first

begin
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new(:rcov) do |t|
      t.binary = vendored_cucumber_bin
      t.fork = true # You may get faster startup if you set this to false
      t.rcov = true
      t.rcov_opts << %[-o "features_coverage"]
      t.rcov_opts << %[-x "features"]
    end
  end
rescue LoadError
  desc 'cucumber rake task not available (cucumber not installed)'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end

