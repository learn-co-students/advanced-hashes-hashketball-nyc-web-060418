# Hashketball Lab
# Laura Nadolski
# May 26 2018

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
        :slam_dunks => 1,
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7,
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5,
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1,
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
        :slam_dunks => 2,
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10,
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5,
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0,
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12,
      }
    }
  }
}
end

# Returns the number of points scored for the given player.
def num_points_scored(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players.each do |name, stats|
    if name == player_name
      return stats[:points]
    end
  end
end

# Returns the shoe size of a given player.
def shoe_size(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players.each do |name, stats|
    if name == player_name
      return stats[:shoe]
    end
  end
end

# Returns an array of the given team's colors.
def team_colors(team_name)
  if team_name == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  elsif team_name == game_hash[:away][:team_name]
    return game_hash[:away][:colors]
  end
end

# Returns an array of the team names.
def team_names
  helper_array = []
  helper_array.push game_hash[:home][:team_name]
  helper_array.push game_hash[:away][:team_name]
  return helper_array
end

# Returns an array of the jersey numbers for the given team.
def player_numbers(team_name)
  helper_array = []
  helper_hash = {}
  if team_name == game_hash[:home][:team_name]
    helper_hash = game_hash[:home][:players]
    helper_hash.each do |name, stats|
      helper_array.push stats[:number]
    end
  elsif team_name == game_hash[:away][:team_name]
    helper_hash = game_hash[:away][:players]
    helper_hash.each do |name, stats|
      helper_array.push stats[:number]
    end
  end
  return helper_array
end

# Returns a hash of the specified player's stats.
def player_stats(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players.each do |name, stats|
    if name == player_name
      return stats
    end
  end
end

# Returns the number of rebounds associated with the player that has the largest shoe size.
def big_shoe_rebounds
  helper_rebounds_array = []
  helper_shoes_array = []
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players.each do |name, stats|
    helper_rebounds_array.push stats[:rebounds]
    helper_shoes_array.push stats[:shoe]
  end
  return helper_rebounds_array[helper_shoes_array.each_with_index.max[1]]
end
