class FirstPreferences < ActiveRecord::Base

  def self.import(file_name)
    CSV.foreach(file_name, skip_lines: /^2013 .*/, headers: true) do |row|
      values = {
          state_ab: row['StateAb'],
          division_id: row["DivisionID"],
          division_name: row['DivisionNm'],
          polling_place_id: row['PollingPlaceID'],
          polling_place: row['PollingPlace'],
          candidate_id: row['CandidateID'],
          candidate_surname: row['Surname'],
          candidate_given_name: row['GivenNm'],
          ballot_position: row['BallotPosition'],
          elected: row['Elected'] == 'Y',
          historic_elected: row['HistoricElected'] == 'Y',
          party_ab: row['PartyAb'],
          party_name: row['PartyNm'],
          ordinary_votes: row['OrdinaryVotes'],
          swing: row['Swing'].to_f
      }
      p FirstPreferences.create(values)
      true
    end
  end

end
