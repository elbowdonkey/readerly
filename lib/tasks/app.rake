namespace :app do
  desc "initialize the application"
  task :init do
    FileUtils.rm('.gitignore')
    FileUtils.cp('config/config.example.yml', 'config/config.yml')
    puts "** Initialization completed"
  end
end