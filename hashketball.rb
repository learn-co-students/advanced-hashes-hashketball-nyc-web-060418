require "pry"
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == "#{player}"
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == "#{player}"
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(teamname)
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if team_data[attribute] == "#{teamname}"
        return team_data[:colors]
      end
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_array << data
      end
    end
  end
  return team_array
end

def player_numbers(players_team)
  number_array = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == "#{players_team}"
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
            number_array << stats[:number]
          end
        end
      end
    end
  end
  number_array
end

def player_stats(player)
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == "#{player}"
            return stats
          end
        end
      end
    end
  end
end

def key_for_max_value(hash)
  max_value = nil
  max_key = nil
  hash.each do |k, v|
    if max_value == nil
      max_value = v
      max_key = k
    elsif max_value < v
      max_value = v
      max_key = k
    end
  end
  max_key
end

def big_shoe_rebounds
  player_shoe_size = {}
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          player_shoe_size[name] = stats[:shoe]
        end
      end
    end
  end
  big_feet = key_for_max_value(player_shoe_size)

  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == big_feet
            return stats[:rebounds]
          end
        end
      end
    end
  end
end
