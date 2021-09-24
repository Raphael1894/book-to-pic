namespace :book_to_pic do
  desc 'TODO'

  task texts: :environment do
    require 'chunky_png'
    filename = "the_egg"
    book_length = Text.count
    square_root =  Math.sqrt(book_length).to_i
    all_words = Text.order(:id)
    size = square_root
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = 0
    y = 0 
    all_words.each do |one_word|
      if y == size
        break
      end
      if x < size
        png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
        
      else
        x = 0
        png[x,y] = ChunkyPNG::Color.rgb(one_word.color_r, one_word.color_g, one_word.color_b)
        y = y + 1
      end
    x = x + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

  task frequencies: :environment do
    require 'chunky_png'
    filename = "frequencies_colors"
    frequency_length = Frequency.count
    square_root =  Math.sqrt(frequency_length).to_i
    all_frequencies = Frequency.order(:id)
    size = square_root
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = 0
    y = 0 
    all_frequencies.each do |one_frequency|
      if y == size
        break
      end
      if x < size
        png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
        
      else
        x = 0
        png[x,y] = ChunkyPNG::Color.rgb(one_frequency.color_r, one_frequency.color_g, one_frequency.color_b)
        y = y + 1
      end
    x = x + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

  task names: :environment do
    require 'chunky_png'
    filename = "names_colors"
    names_length = Name.count
    square_root =  Math.sqrt(names_length).to_i
    all_names = Name.order(:id)
    size = square_root
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = 0
    y = 0 
    all_names.each do |one_name|
      if y == size
        break
      end
      if x < size
        png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
        
      else
        x = 0
        png[x,y] = ChunkyPNG::Color.rgb(one_name.color_r, one_name.color_g, one_name.color_b)
        y = y + 1
      end
    x = x + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

  task numbers: :environment do
    require 'chunky_png'
    filename = "numbers_colors"
    number_length = Number.count
    square_root =  Math.sqrt(number_length).to_i
    all_numbers = Number.order(:id)
    size = square_root
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = 0
    y = 0 
    all_numbers.each do |one_number|
      if y == size
        break
      end
      if x < size
        png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
        
      else
        x = 0
        png[x,y] = ChunkyPNG::Color.rgb(one_number.color_r, one_number.color_g, one_number.color_b)
        y = y + 1
      end
    x = x + 1
    end
  png.save("#{filename}.png", :best_compression)
  end

end


