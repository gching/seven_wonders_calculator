require 'factory_girl_rails'
require 'database_cleaner'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    #require File.expand_path("spec/factories/player.rb")
    Rake::Task["db:reset"].invoke
    #DatabaseCleaner.clean
    3.times do |match|
      7.times do |player|
        FactoryGirl.create(:player, game_id: match)
      end
    end

  end
end
