namespace :election do

  desc "import election data"
  task import: :environment do
    FirstPreferences.delete_all
    FirstPreferences.import('db/data/2013/HouseStateFirstPrefsByPollingPlaceDownload-17496-VIC.csv')
  end

end
