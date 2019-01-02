require "pry"

def get_first_name_of_season_winner(data, season)
  data.fetch(season).find {|i| i["status"] == "Winner"}["name"].split.first
end

def all_contestants(data)
  all_contestants = []
  data.each do |season, contestant|
    all_contestants.concat(contestant)
  end 
  all_contestants
end 

def get_contestant_name(data, occupation)
  all_contestants(data).find {|contestant| contestant["occupation"] == occupation}["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).count do |contestant|
    contestant["hometown"] == hometown
  end 
end

def get_occupation(data, hometown)
  all_contestants(data).find {|contestant| contestant["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  season_data = data.fetch(season)
  (season_data.reduce(0) {|sum, contestant|
   sum + contestant["age"].to_f} / season_data.length).round
end
