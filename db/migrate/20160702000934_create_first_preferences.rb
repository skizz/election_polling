class CreateFirstPreferences < ActiveRecord::Migration
  def change
    create_table :first_preferences do |t|
      # StateAb,DivisionID,DivisionNm,PollingPlaceID,PollingPlace,CandidateID,Surname,GivenNm,BallotPosition,Elected,HistoricElected,PartyAb,PartyNm,OrdinaryVotes,Swing
      t.string 'state_ab'
      t.integer 'division_id'
      t.string 'division_name'
      t.integer 'polling_place_id'
      t.string 'polling_place'
      t.integer 'candidate_id'
      t.string 'candidate_surname'
      t.string 'candidate_given_name'
      t.integer 'ballot_position'
      t.boolean 'elected'
      t.boolean 'historic_elected'
      t.string 'party_ab'
      t.string 'party_name'
      t.integer 'ordinary_votes'
      t.float 'swing'
    end
  end
end
