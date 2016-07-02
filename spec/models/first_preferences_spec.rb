require 'rails_helper'

RSpec.describe FirstPreferences, type: :model do
  before(:all) {
    FirstPreferences.delete_all
    FirstPreferences.import('db/data/2013/HouseStateFirstPrefsByPollingPlaceDownload-17496-VIC.csv', count: 50)
  }

  it 'should import first prefs data' do
    expect(FirstPreferences.count).to eq(50)
  end

  it 'should show the last election results' do
    prefs = FirstPreferences.where(polling_place: "Bayswater").order(:ballot_position)
    expect(prefs.count).to eq(8)
  end
end
