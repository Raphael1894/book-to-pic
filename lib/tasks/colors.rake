namespace :colors do
  desc 'TODO'

  task allocate_colors_to_frequencies: :environment do
    all_frequencies = Frequency.all
    frequency_length = Frequency.count
    minimum = 0.to_f
    maximum = Frequency.count.to_f
    all_frequencies.each do |one_frequency|
      value = one_frequency.rank.to_f
      ratio = 2 * (value - minimum) / (maximum - minimum)
      b = ((255*(1 - ratio)).round).to_i
      r = ((255*(ratio - 1)).round).to_i
      g = (255 - b - r).to_i
      one_frequency.update(color_r: r)
      one_frequency.update(color_g: g)
      one_frequency.update(color_b: b)
      progress = one_frequency.rank * 100 / frequency_length
      puts "(#{progress}%)".magenta + " saving frequency" + "#{one_frequency.color_r}".red + "#{one_frequency.color_g}".green + "#{one_frequency.color_b}".blue
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
      b = ([0, 255*(1 - ratio)].max).round
      r = ([0, 255*(ratio - 1)].max).round
      g = (255 - b - r).round
      one_name.update(color_r: r)
      one_name.update(color_g: g)
      one_name.update(color_b: b)
      progress = one_name.rank * 100 / name_length
      puts "(#{progress}%)".magenta + " saving name" + "#{one_name.color_r}".red + "#{one_name.color_g}".green + "#{one_name.color_b}".blue
    end
  end

  task allocate_colors_to_numbers: :environment do
    name_length = 100000
    minimum = 0.to_f
    maximum = name_length.to_f
    (0..name_length).each do |one_number|
      value = one_number.to_f
      ratio = 2 * (value-minimum) / (maximum - minimum)
      b = ((255*(1 - ratio)).round).to_i
      r = ((255*(ratio - 1)).round).to_i
      g = (255 - b - r).to_i
      Number.create!(name: one_number, color_r: r, color_g: g, color_b: b)
      progress = one_number * 100 / name_length
      puts "(#{progress}%)".magenta + " saving number"
    end
  end
end