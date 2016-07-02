require 'csv'

class FirstPreferences < ActiveRecord::Base

  def self.formals(polling_place = 'Newlands (Wills)')
    FirstPreferences
        .where(polling_place: polling_place)
        .where('ballot_position <> 999')
        .order('ordinary_votes desc')
  end

  def self.informals(polling_place = 'Newlands (Wills)')
    FirstPreferences
        .where(polling_place: polling_place)
        .where('ballot_position = 999')
        .order('ordinary_votes desc')
  end

  def styles
    styles = []
    styles << 'bg-success' if party_ab == 'GRN'
    styles << 'bg-danger' if ballot_position == 999
    styles.join(' ')
  end

  def self.import(file_name, options = {})

    count = 0
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

      count = count + 1
      break if options[:count] && options[:count] <= count

      true
    end
    puts "Imported #{count} rows."
  end

end
