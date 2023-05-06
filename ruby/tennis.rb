class TennisGame
  def initialize(player1Name, player2Name)
    @player1_name = player1Name
    @player2_name = player2Name
    @player1_points = 0
    @player2_points = 0
  end
      
  def won_point(player_name)
    instance_variable_set("@#{player_name}_points", instance_variable_get("@#{player_name}_points")+1)
  end
  
  # 0 points= Love
  # 1 point = Fifteen
  # 2 points= Thirty
  # 3 points= Forty
  # Tied score= All
  # 40-40 = Deuce
  def score
    if (@player1_points < 4 and @player2_points < 4) and (@player1_points + @player2_points < 6)  # both players under 40 / one 40 and the other not
      point_system = ["Love", "Fifteen", "Thirty", "Forty"]
      player1_score = point_system[@player1_points]
      player2_score = point_system[@player2_points]
      @player1_points == @player2_points ? player1_score + "-All" : player1_score + "-" + player2_score
    else
      if (@player1_points == @player2_points) # Deuce 40-40 or Advantage Deuce
        "Deuce"
      else # Advantage for one player or winner
        leading_or_winner_name = @player1_points > @player2_points ? @player1_name : @player2_name
        (@player1_points-@player2_points).abs == 1 ? "Advantage " + leading_or_winner_name : "Win for " + leading_or_winner_name
      end
    end
  end
end

class TennisGame1 < TennisGame
end

class TennisGame2 < TennisGame
end

class TennisGame3 < TennisGame  
end
