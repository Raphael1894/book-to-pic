namespace :spiral do

  task texts: :environment do
    require 'chunky_png'
    filename = "lolita_rgb"
    texts_length = Text.count
    square_root =  Math.sqrt(texts_length).to_i
    size = square_root + 2
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = (size / 2).round
    y = (size / 2).round
    a = 1
    n = 1
    while n < texts_length
      (1..a).each do 
        if Text.exists?(id: n)
          one_word = Text.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
          x = x - 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do 
        if Text.exists?(id: n)
          one_word = Text.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
          y = y - 1
          n = n + 1
        else 
          break
        end
      end
      a = a + 1
      (1..a).each do
        if Text.exists?(id: n)
          one_word = Text.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
          x = x + 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Text.exists?(id: n)
          one_word = Text.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
          y = y + 1
          n = n + 1
        else 
          break
        end
      end
      progress = n * 100 / texts_length
      puts "spiral texts #{progress}%".magenta
    a = a + 1
    end
  puts "file saved".green
  png.save("#{filename}.png", :best_compression)
  end

  task frequencies: :environment do
    require 'chunky_png'
    filename = "frequencies_spiral"
    frequencies_length = Frequency.count
    square_root =  Math.sqrt(frequencies_length).to_i
    size = square_root + 2
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = (size / 2).round
    y = (size / 2).round
    a = 1
    n = 1
    while n < frequencies_length
      (1..a).each do 
        if Frequency.exists?(id: n)
          one_frequency = Frequency.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
          x = x - 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Frequency.exists?(id: n)
          one_frequency = Frequency.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
          y = y - 1
          n = n + 1
        else 
          break
        end
      end
      a = a + 1
      (1..a).each do
        if Frequency.exists?(id: n)
          one_frequency = Frequency.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
          x = x + 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Frequency.exists?(id: n)
          one_frequency = Frequency.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
          y = y + 1
          n = n + 1
        else 
          break
        end
      end
      progress = n * 100 / frequencies_length
      puts "spiral frequencies #{progress}%".magenta
    a = a + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

  task names: :environment do
    require 'chunky_png'
    filename = "names_spiral"
    names_length = Name.count
    square_root =  Math.sqrt(names_length).to_i
    size = square_root + 2
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = (size / 2).round
    y = (size / 2).round
    a = 1
    n = 1
    while n < names_length
      (1..a).each do 
        if Name.exists?(id: n)
          one_name = Name.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
          x = x - 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Name.exists?(id: n)
          one_name = Name.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
          y = y - 1
          n = n + 1
        else 
          break
        end
      end
      a = a + 1
      (1..a).each do
        if Name.exists?(id: n)
          one_name = Name.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
          x = x + 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Name.exists?(id: n)
          one_name = Name.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
          y = y + 1
          n = n + 1
        else 
          break
        end
      end
      progress = n * 100 / names_length
      puts "spiral names #{progress}%".magenta
    a = a + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

  task numbers: :environment do
    require 'chunky_png'
    filename = "numbers_spiral"
    numbers_length = Number.count
    square_root =  Math.sqrt(numbers_length).to_i
    size = square_root + 2
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = (size / 2).round
    y = (size / 2).round
    a = 1
    n = 1
    while n < numbers_length
      (1..a).each do 
        if Number.exists?(id: n)
          one_number = Number.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
          x = x - 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Number.exists?(id: n)
          one_number = Number.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
          y = y - 1
          n = n + 1
        else 
          break
        end
      end
      a = a + 1
      (1..a).each do
        if Number.exists?(id: n)
          one_number = Number.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
          x = x + 1
          n = n + 1
        else 
          break
        end
      end
      (1..a).each do
        if Number.exists?(id: n)
          one_number = Number.find(n)
          #puts "x : #{x}".green + " y : #{y}".cyan + " a : #{a}".yellow
          png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
          y = y + 1
          n = n + 1
        else 
          break
        end
      end
      progress = n * 100 / numbers_length
      puts "spiral numbers #{progress}%".magenta
    a = a + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

end
