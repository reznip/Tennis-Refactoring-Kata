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
  
  def score
    if (@player1_points < 4 and @player2_points < 4) and (@player1_points + @player2_points < 6)
      @point_system = ["Love", "Fifteen", "Thirty", "Forty"]
      s = @point_system[@player1_points]
      @player1_points == @player2_points ? s + "-All" : s + "-" + @point_system[@player2_points]
    else
      if (@player1_points == @player2_points)
        "Deuce"
      else
        leading_or_winner_name = @player1_points > @player2_points ? @player1_name : @player2_name
        (@player1_points-@player2_points)*(@player1_points-@player2_points) == 1 ? "Advantage " + leading_or_winner_name : "Win for " + leading_or_winner_name
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
