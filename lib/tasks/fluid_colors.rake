namespace :fluid_colors do

  task texts: :environment do
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
      puts "fluid_colors texts #{progress}%".magenta
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
    frequencies_length = Frequency.count
    #puts "#{frequencies_length}".yellow
    rgb_maximum = 16777216
    ascent = true
    steps = (rgb_maximum / frequencies_length)
    g_n_b_max = 65536
    step_to_g_n_b = (g_n_b_max / steps)
    value = 0
    x = 0
    y = 0
    all_frequencies.each do |one_frequency|
      if ascent == true
        if x > g_n_b_max
          value = value + 65536
          ascent = false
          y = 0
        else
          red = value / (256*256)
          green = (value/256) % 256
          blue = value % 256
          one_frequency.update(color_r: red.to_i)
          one_frequency.update(color_g: green.to_i)
          one_frequency.update(color_b: blue.to_i)
          #puts "(#{progress}%)".magenta + " saving name " + "#{one_frequency.color_r} ".red + "#{one_frequency.color_g} ".green + "#{one_frequency.color_b}".blue
          x = x + steps
          value = value + steps
        end
      else
        if y >= g_n_b_max
          value = value + 65536
          ascent = true
          x = 0
        else
          red = value / (256*256)
          green = (value/256) % 256
          blue = value % 256
          one_frequency.update(color_r: red.to_i)
          one_frequency.update(color_g: green.to_i)
          one_frequency.update(color_b: blue.to_i)
          progress = one_frequency.id * 100 / frequencies_length
          puts "fluid_colors frequencies #{progress}%".magenta
          #puts "(#{progress}%)".magenta + " saving name " + "#{one_frequency.color_r} ".red + "#{one_frequency.color_g} ".green + "#{one_frequency.color_b}".blue
          y = y + steps
          value = value - steps
        end
      end
    end
  end

  task names: :environment do
    all_names = Name.order(:id)
    name_length = Name.count
    #puts "#{name_length}".yellow
    rgb_maximum = 16777216
    ascent = true
    steps = (rgb_maximum / name_length)
    g_n_b_max = 65536
    step_to_g_n_b = (g_n_b_max / steps)
    value = 0
    x = 0
    y = 0
    all_names.each do |one_name|
      if ascent == true
        if x > g_n_b_max
          value = value + 65536
          ascent = false
          y = 0
        else
          red = value / (256*256)
          green = (value/256) % 256
          blue = value % 256
          one_name.update(color_r: red.to_i)
          one_name.update(color_g: green.to_i)
          one_name.update(color_b: blue.to_i)
          #puts "(#{progress}%)".magenta + " saving name " + "#{one_name.color_r} ".red + "#{one_name.color_g} ".green + "#{one_name.color_b}".blue
          x = x + steps
          value = value + steps
        end
      else
        if y >= g_n_b_max
          value = value + 65536
          ascent = true
          x = 0
        else
          red = value / (256*256)
          green = (value/256) % 256
          blue = value % 256
          one_name.update(color_r: red.to_i)
          one_name.update(color_g: green.to_i)
          one_name.update(color_b: blue.to_i)
          progress = one_name.id * 100 / name_length
          puts "fluid_colors names #{progress}%".magenta
          #puts "(#{progress}%)".magenta + " saving name " + "#{one_name.color_r} ".red + "#{one_name.color_g} ".green + "#{one_name.color_b}".blue
          y = y + steps
          value = value - steps
        end
      end
    end
  end

  task numbers: :environment do
    Number.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('numbers')
    number_length = 100000
    #puts "#{number_length}".yellow
    rgb_maximum = 16777216
    ascent = true
    steps = (rgb_maximum / number_length)
    g_n_b_max = 65536
    step_to_g_n_b = (g_n_b_max / steps)
    value = 0
    x = 0
    y = 66666
    (0..number_length).each do |one_number|
      if ascent == true
        red = value / (256*256)
        green = (value/256) % 256
        blue = value % 256
        Number.create!(name: one_number, color_r: red, color_g: green, color_b: blue)
        x = x + steps
        value = value + steps
        if x > g_n_b_max
          value = value + 65536
          ascent = false
          y = 0
        end
      else
        red = value / (256*256)
        green = (value/256) % 256
        blue = value % 256
        Number.create!(name: one_number, color_r: red, color_g: green, color_b: blue)
        progress = one_number * 100 / number_length
        puts "fluid_colors numbers #{progress}%".magenta
        y = y + steps
        value = value - steps
        if y > g_n_b_max
          value = value + 65536
          ascent = true
          x = 0
        end
      end
    end
  end

end
