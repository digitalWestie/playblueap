namespace :actions do
  desc "Create tags"
  task :create => :environment do
    #configure twitter
    Twitter.configure do |config|
      config.consumer_key = "" #yall gotta get this yourself
      config.consumer_secret = ""
      config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => { 
        :open_timeout => 20,
        :timeout => 30
      })
    end
    #search 
  end
end