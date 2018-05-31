require "pry"
def game_hash
#contains and returns a nested hash
game = {
  :home => {
    :team_name => "Brooklyn Nets", 
    :colors => ["Black", "White"], 
    :players => {
      "Alan Anderson"=> {
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
         "Brook Lopez"=> {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
         "Mason Plumlee"=> {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
         "Jason Terry"=> {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      },
    }
  }, 
  :away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players => {
      "Jeff Adrien"=> {
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
         "DeSagna Diop"=> {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
         "Ben Gordon"=> {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
         "Brendan Haywood"=> {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      },
    }
  }
}
end  

def num_points_scored(player_name)
  game = game_hash
  points = nil
  game.each do |location, team_data|
    if team_data[:players][player_name]
    points = team_data[:players][player_name][:points]
    end
  end
  points
end  

def shoe_size(player_name)
  game = game_hash
  size = nil
  game.each do |location, team_data|
    if team_data[:players][player_name]
    size = team_data[:players][player_name][:shoe]
    end
  end
  size
end 

def team_colors(team_name)
  game = game_hash
  colors = nil
  game.each do |location, team_data|
    if team_data[:team_name] == team_name
      colors = team_data[:colors]
    end  
  end  
  colors
end  

def team_names
  game = game_hash
  team_arr = []
  game.each do |location, team_data|
    team_arr << team_data[:team_name]
  end  
  team_arr
end

def player_numbers(team_name)
  game = game_hash
  numbers = nil
  game.each do |location, team_data|
    if team_data[:team_name] == team_name
      numbers = team_data[:players].collect do |player_name, player_stats|
          player_stats[:number]
        end  
    end
  end 
  numbers
end

def player_stats(player_name)
  game = game_hash
  stats = nil
  game.each do |location, team_data|
    if team_data[:players][player_name]
    stats = team_data[:players][player_name]
    end
  end
  stats
end  

def big_shoe_rebounds
  game = game_hash
  player_with_largest_shoe = nil
  game.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      current_player_shoe = player_stats[:shoe]
      if player_with_largest_shoe == nil
        player_with_largest_shoe = player_stats
      elsif current_player_shoe > player_with_largest_shoe[:shoe]
        player_with_largest_shoe = player_stats
      end
    end  
  end  
  player_with_largest_shoe[:rebounds]
end  

 




