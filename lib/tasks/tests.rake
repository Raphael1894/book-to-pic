namespace :tests do

  task create_spiral_image: :environment do
    require 'chunky_png'
    filename = "names_colors_spiral"
    names_length = Name.count
    square_root =  Math.sqrt(names_length).to_i
    all_names = Name.order(:id)
    size = square_root + 1
    png = ChunkyPNG::Image.new(size, size, ChunkyPNG::Color::TRANSPARENT)
    x = square_root / 2
    y = square_root / 2
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
          one_name = Name.select(id: n)
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
      a = a + 1
    end
  png.save("#{filename}.png", :best_compression)
  end
end
