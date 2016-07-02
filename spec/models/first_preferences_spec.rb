require 'rails_helper'

require 'csv'

RSpec.describe FirstPreferences, type: :model do
  it 'should import the 2013 election' do
    FirstPreferences.import('db/data/2013/HouseStateFirstPrefsByPollingPlaceDownload-17496-VIC.csv')
    expect(FirstPreferences.count).to eq(50)
  end
end
