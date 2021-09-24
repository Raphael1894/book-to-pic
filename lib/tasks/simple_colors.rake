namespace :simple_colors do
  desc 'TODO'
 
  task text: :environment do
    Missing.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('missings') 
    all_text = Text.order(:id)
    text_length = Text.count
    x = 1
    all_text.each do |one_text|
      one_frequency = Frequency.find_by(word: one_text.word)
        if one_frequency != nil
          one_text.update(color_r: one_frequency.color_r)
          one_text.update(color_g: one_frequency.color_g)
          one_text.update(color_b: one_frequency.color_b)
        else 
        one_name = Name.find_by(firstName: one_text.word)
        if one_name != nil
          one_text.update(color_r: one_name.color_r)
          one_text.update(color_g: one_name.color_g)
          one_text.update(color_b: one_name.color_b)
        else
          one_number = Number.find_by(name: one_text.word)
          if one_number != nil
            one_text.update(color_r: one_number.color_r)
            one_text.update(color_g: one_number.color_g)
            one_text.update(color_b: one_number.color_b)
          else
            #puts "word not found : #{one_text.word} position #{one_text.position}".red
            Missing.create!(word: one_text.word, position: one_text.position)
          end
        end
      end
      progress = x * 100 / text_length
      #puts "(#{progress}%)".magenta + " saved " +  "#{one_text.word}".cyan
      x = x + 1
    end
    Text.order('id ASC')
    if Missing.any?
      puts "** List of missing words **".red
      all_missed = Missing.order(:id)
      all_missed.each do |one_missed|
        puts "word not found : " + "*#{one_missed.word}* ".cyan + "position #{one_missed.position}".green
      end
    end
  end

  task frequencies: :environment do
    all_frequencies = Frequency.order(:id)
    frequency_length = Frequency.count
    #puts "#{frequency_length}".yellow
    rgb_maximum = 16777216
    value = 0
    steps = (rgb_maximum / frequency_length)
    all_frequencies.each do |one_frequency|
      #puts "#{value}".yellow
      red = value / (256*256).to_i
      green = (value/256) % 256.to_i
      blue = value % 256.to_i

      one_frequency.update(color_r: red)
      one_frequency.update(color_g: green)
      one_frequency.update(color_b: blue)

      progress = one_frequency.rank * 100 / frequency_length
      #puts "(#{progress}%)".magenta + " saving frequency" + "#{one_frequency.color_r}".red + "#{one_frequency.color_g}".green + "#{one_frequency.color_b}".blue
      value = value + steps
    end
  end

  task names: :environment do
    all_names = Name.order(:id)
    name_length = Name.count
    #puts "#{name_length}".yellow
    rgb_maximum = 16777216
    value = 0
    steps = (rgb_maximum / name_length)
    all_names.each do |one_name|
      #puts "#{value}".yellow
      red = value / (256*256).to_i
      green = (value/256) % 256.to_i
      blue = value % 256.to_i

      one_name.update(color_r: red)
      one_name.update(color_g: green)
      one_name.update(color_b: blue)
      
      progress = one_name.id * 100 / name_length
      #puts "(#{progress}%)".magenta + " saving name " + "#{one_name.color_r} ".red + "#{one_name.color_g} ".green + "#{one_name.color_b}".blue
      value = value + steps
    end
  end

  task numbers: :environment do
    Number.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('numbers')
    number_length = 100000
    rgb_maximum = 16777216
    value = 0
    steps = (rgb_maximum / number_length)
    (0..number_length).each do |one_number|
      red = value / (256*256).to_i
      green = (value/256) % 256.to_i
      blue = value % 256.to_i

      Number.create!(name: one_number, color_r: red, color_g: green, color_b: blue)
      progress = one_number * 100 / number_length
      #puts "(#{progress}%)".magenta + " saving number " + "(#{one_number})".cyan
      value = value + steps
    end
  end

end
