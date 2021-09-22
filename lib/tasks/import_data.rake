namespace :import_data do
  task import_frequencies: :environment do
    require 'csv'    
    csv_length = CSV.read('lib/assets/words_freq.csv').count
    csv_text = File.read('lib/assets/words_freq.csv')
    csv = CSV.parse(csv_text, :headers => true)
    x = 1
    csv.each do |row|
      row[:rank] = x
      progress = x * 100 / csv_length
      puts "saving #{row} (#{progress}%)".cyan
      Frequency.create!(row.to_hash)
      x = x + 1
    end
  end

  task import_names: :environment do
    require 'csv'   

    csv_length = CSV.read('lib/assets/names_freq.csv').count
    csv_text = File.read('lib/assets/names_freq.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    x = 1
    csv.each do |row|
      row[:rank] = x
      progress = x * 100 / csv_length
      puts "saving #{row} #{x} (#{progress}%)".cyan
      Name.create!(row.to_hash)
      x = x + 1
    end
  end

  task import_text: :environment do
     file = File.open('lib/assets/text_to_db.txt')
     total_lines = file.readlines.size # Get total lines number
 
     puts "Extracting words from #{filepath} lines: #{total_lines}"
     file.seek(0)
     file.each_with_index do |line,index|
       current_line_nb = index + 1
       progress = current_line_nb * 100 / total_lines
       puts "Reading line #{current_line_nb} out of #{total_lines} (#{progress}%)".magenta
      words = []
      words = line.split(/[^[[:word:]]]+/)
        words.each do |word|
          puts "saving #{word}".cyan
          Text.create!(word: word)
        end
     end
  end

end
