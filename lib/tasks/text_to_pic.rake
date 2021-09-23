namespace :text_to_pic do
  desc 'TODO'
  task generate_matrice: :environment do
    require "matrix"
    book_length = Text.count

    square_root =  Math.sqrt(book_length).to_i
    all_words = Text.all
    matrix = []
    temporary_matrix = []
    all_words.each do |one_word|
      if temporary_matrix.count <= square_root
        temporary_matrix << one_word.word
      else
        matrix << temporary_matrix
        temporary_matrix = []
      end
      puts "#{temporary_matrix}".cyan
    end
    puts "#{matrix}".magenta
    mat = Matrix.columns(matrix)
    puts "#{mat}".cyan
  end

  task allocate_colors_to_frequencies: :environment do
    all_frequencies = Frequency.all
    frequency_length = Frequency.count
    minimum = 0.to_f
    maximum = Frequency.count.to_f
    all_frequencies.each do |one_frequency|
      value = one_frequency.rank.to_f
      ratio = 2 * (value-minimum) / (maximum - minimum)
      b = ((255*(1 - ratio)).round).to_i
      r = ((255*(ratio - 1)).round).to_i
      g = (255 - b - r).to_i
      one_frequency.update(color_r: r)
      one_frequency.update(color_g: g)
      one_frequency.update(color_b: b)
      progress = one_frequency.rank * 100 / frequency_length
      puts " saving" + "#{one_frequency.color_r}".red + "#{one_frequency.color_g}".green + "#{one_frequency.color_b}".blue + "(#{progress}%)".magenta
    end
  end

  task allocate_colors_to_names: :environment do
    all_names = Name.all
    name_length = Name.count
    minimum = 0.to_f
    maximum = Name.count.to_f
    all_names.each do |one_name|
      value = one_name.rank.to_f
      ratio = 2 * (value-minimum) / (maximum - minimum)
      b = ((255*(1 - ratio)).round).to_i
      r = ((255*(ratio - 1)).round).to_i
      g = (255 - b - r).to_i
      one_name.update(color_r: r)
      one_name.update(color_g: g)
      one_name.update(color_b: b)
      progress = one_name.rank * 100 / name_length
      puts " saving" + "#{one_name.color_r}".red + "#{one_name.color_g}".green + "#{one_name.color_b}".blue + "(#{progress}%)".magenta
    end
  end
end