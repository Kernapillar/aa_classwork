class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
  false
  end
  
  def get_matching_indices(char)
    indicies_arr = []
    @secret_word.each_char.with_index {|secret_char, i| indicies_arr << i if secret_char == char}
    indicies_arr
  end

  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
  end

  # Part 2

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else 
      @attempted_chars << char
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end
      return true
    end

  end

  def ask_user_for_guess
    puts "Enter a char: "
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      return true 
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win?  || self.lose?
      puts @secret_word
      return true
    end
    false
  end
end

