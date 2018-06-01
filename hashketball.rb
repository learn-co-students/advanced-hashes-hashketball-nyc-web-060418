require 'pry'

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

def players
  n = game_hash[:home][:players]
  n.merge!(game_hash[:away][:players])
  n
end


def player_data(name)
  players.fetch(name)
end

def num_points_scored(name)
  scorer = player_data(name)
  scorer.fetch(:points)
end

def shoe_size(name)
  shoe = player_data(name)
  shoe.fetch(:shoe)
end

def team_color_name_nest
  team_hash = {game_hash[:home][:team_name] => game_hash[:home][:colors], game_hash[:away][:team_name] => game_hash[:away][:colors]}
  team_hash
end

def team_colors(name)
  team_color_name_nest.fetch(name)
end

def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  teams
end

def select_team(team_name)
  team = game_hash.values
  team.find {|team| team.fetch(:team_name) == team_name}
end

def player_numbers(team_name)
  select_team(team_name)[:players].map {|player_name, stats| stats[:number]}
end

def player_stats(player_name)
  players.fetch(player_name)
end

def biggest_shoe
  shoe_hash = players.sort_by {|name, stats| stats.fetch(:shoe)}.reverse
  shoe_hash.first
end


def big_shoe_rebounds
  biggest_shoe[1].fetch(:rebounds)
end
