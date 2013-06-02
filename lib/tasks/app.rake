namespace :app do
  desc "initialize the application"
  task :init do
    FileUtils.rm('.gitignore')
    FileUtils.cp('config/config.example.yml', 'config/config.yml')
    puts "** Initialization completed"
  end

  task :deploy do
    system("git add config/*")
    system("git ci -m 'prepare for deployment'")
    system("git push heroku master")
    system("heroku run rake db:migrate")
    system("heroku run bundle exec rails runner 'User.setup!'")
    puts "** Setup completed"
  end
end