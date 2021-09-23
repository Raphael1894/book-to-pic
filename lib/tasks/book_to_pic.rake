namespace :book_to_pic do
  desc 'TODO'

  #task generate_matrice: :environment do
  #  require "matrix"
  #  Matrice.delete_all
  #  ActiveRecord::Base.connection.reset_pk_sequence!('matrices') 
  #  book_length = Text.count
  #  square_root =  Math.sqrt(book_length).to_i
  #  all_words = Text.all
  #  matrix = []
  #  temporary_matrix = []
  #  x = 1
  #  all_words.each do |one_word|
  #    if temporary_matrix.count <= square_root
  #      temporary_matrix << one_word.word
  #    else
  #      matrix << temporary_matrix
  #      temporary_matrix = []
  #    end
  #    progress = x * 100 / book_length
  #    puts "#{temporary_matrix}".cyan
  #    x = x + 1
  #  end
  #  puts "#{matrix}".magenta
  #  #mat = Matrix.columns(matrix)
  #  #puts "#{mat}".cyan
  #  Matrice.create!(mat: matrix)
  #end

  task color_text: :environment do
    Missing.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('missings') 
    all_text = Text.all
    text_length = Text.count
    x = 1
    all_text.each do |one_text|
      one_name = Name.find_by(firstName: one_text.word)
       if one_name != nil
        one_text.update(color_r: one_name.color_r)
        one_text.update(color_g: one_name.color_g)
        one_text.update(color_b: one_name.color_b)
       else 
        one_frequency = Frequency.find_by(word: one_text.word)
        if one_frequency != nil
          one_text.update(color_r: one_frequency.color_r)
          one_text.update(color_g: one_frequency.color_g)
          one_text.update(color_b: one_frequency.color_b)
        else
          one_number = Number.find_by(name: one_text.word)
          if one_number != nil
            one_text.update(color_r: one_number.color_r)
            one_text.update(color_g: one_number.color_g)
            one_text.update(color_b: one_number.color_b)
          else
            one_text.update(color_r: 0)
            one_text.update(color_g: 0)
            one_text.update(color_b: 0)
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
      #puts "** List of missing words **".red
      all_missed = Missing.all
      all_missed.each do |one_missed|
        #puts "word not found : " + "*#{one_missed.word}* ".cyan + "position #{one_missed.position}".green
      end
    end
  end

  task create_image: :environment do
    require 'chunky_png'
    filename = "the-fellowship-of-the-ring"
    book_length = Text.count
    square_root =  Math.sqrt(book_length).to_i
    all_words = Text.all
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
end

##For the nth order Hilbert curve, output is an array of arrays containing x and y-coordinates
#def hilbert(n)
#
#  if n <= 0
#    x = 0
#    y = 0
#    return [[x],[y]]
#  else
#    coords = hilbert(n-1);
#    x = []
#    y = []
#    # Generate X-Coordinates
#    coords[1].each{|ycoord| x << (ycoord-0.5)*0.5}
#    coords[0].each{|xcoord| x << (xcoord-0.5)*0.5}
#    coords[0].each{|xcoord| x << (xcoord+0.5)*0.5}
#    coords[1].each{|ycoord| x << (0.5-ycoord)*0.5}
#    # Generate Y-Coordinates
#    coords[0].each{|xcoord| y << (xcoord-0.5)*0.5}
#    coords[1].each{|ycoord| y << (ycoord+0.5)*0.5}
#    coords[1].each{|ycoord| y << (ycoord+0.5)*0.5}
#    coords[0].each{|xcoord| y << (-0.5-xcoord)*0.5}
#    return [x,y]
#  end
#end