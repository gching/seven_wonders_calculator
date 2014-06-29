class Player < ActiveRecord::Base

  ## Setup hstore with the proper keys, and then validate it to be a number.
  ## Automatically validates its presence as it gives an error if its not a number.
  ## Also defines each method to return it as an integer rather than a string.
  %w[victories coins wonders blues yellows purples tablets compasses gears leaders blacks].each do |key|
    store_accessor :points, key
    validates_numericality_of key

    define_method(key) do
      return super().to_i if is_integer(super())
      super()
    end
  end
  ## Validates that game_id and name exists
  validates_presence_of :game_id, :name, :points

  ## Before saving, calculate score
  before_save :gen_score


private

  ## Helps generate the total score of this player in this match
  def gen_score
    ## Calculate the score here!

    total_score = victories + coins/3 + blues + yellows + purples + leaders + blacks
    ## Greens
    greens = [tablets, compasses, gears]
    total_score += (greens.min*7) + greens[0]**2 + greens[1]**2 + greens[2]**2
    self.score = total_score
  end

  ## Checks if in the current string is a string of an integer.
  def is_integer(string)
    /\A[+-]?\d+\Z/ === string
  end


end
