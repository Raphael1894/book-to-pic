namespace :import_data do
  task import_frequencies: :environment do
    require 'csv'   
    Frequency.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('frequencies') 
    csv_length = CSV.read('lib/assets/words_freq.csv').count
    csv_text = File.read('lib/assets/words_freq.csv')
    csv = CSV.parse(csv_text, :headers => true)
    x = 1
    csv.each do |row|
      row[:rank] = x
      progress = x * 100 / csv_length
      #puts "(#{progress}%)".magenta + " saving #{row}".cyan
      Frequency.create!(row.to_hash)
      x = x + 1
    end
  end

  task import_names: :environment do
    require 'csv'   
    Name.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('names')
    csv_length = CSV.read('lib/assets/names_freq.csv').count
    csv_text = File.read('lib/assets/names_freq.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    x = 1
    csv.each do |row|
      row.each { |k, v| v.downcase! }
      row[:rank] = x
      progress = x * 100 / csv_length
      #puts "(#{progress}%)".magenta + " saving #{row} #{x} (#{progress}%)".cyan
      Name.create!(row.to_hash)
      x = x + 1
    end
  end

  task texts: :environment do
    Text.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('texts')
    file = File.open('lib/assets/the_fellowship_of_the_ring.txt')
    total_lines = file.readlines.size # Get total lines number
    file.seek(0)
    x = 1
    file.each_with_index do |line,index|
      current_line_nb = index + 1
      progress = current_line_nb * 100 / total_lines
      #puts "(#{progress}%)".magenta + " Reading line #{current_line_nb} out of #{total_lines}".cyan
    words = []
    line = line.gsub("-", " ")
    words = line.split(/\s/).delete_if(&:blank?)
      words.each do |word|
        word.downcase!
        word.delete! '.'
        word.delete! ','
        word.delete! '?'
        word.delete! '!'
        word.delete! '"'
        word.delete! "'"
        word.delete! 'ā'
        word.delete! 'ā'
        word.delete! 'ā¦'
        word.gsub!("iām", "i am")
        word.gsub!("iāll", "i will")
        word.gsub!("youāre", "you are")
        word.gsub!("youāve", "you have")
        word.gsub!("iāve", "i have")
        word.gsub!("itās", "it is")
        word.gsub!("thatās", "that is")
        word.gsub!("thereās", "there is")
        word.gsub!("whatās", "what is")
        word.gsub!("isnāt", "is not")
        word.gsub!("wouldnāt", "would not")
        word.gsub!("youāll", "you will")
        word.gsub!("youād", "you would")
        word.gsub!("donāt", "do not")
        word.gsub!("wonāt", "will not")
        word.gsub!("sheāll", "she will")
        word.gsub!("heāll", "he will")
        word.gsub!("didnāt", "did not")
        word.gsub!("havenāt", "have not")
        word.gsub!("theyāll", "they will")
        #puts "saving #{word} #{x} ".cyan
        if word == "i am"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "i will"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "you are"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "i have"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "it is"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "that is"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "you have"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "there is"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "what is"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "is not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "would not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "you will"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "you would"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "do not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "will not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "she will"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "he will"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "did not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "have not"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word == "they will"
          words = word.split(/\s/).delete_if(&:blank?)
          words.each do |word|
            Text.create!(word: word, position: x)
          end
        elsif word != nil
          Text.create!(word: word, position: x)
        end
        x = x + 1
      end
    end
  end

end
