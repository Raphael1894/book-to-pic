namespace :matrix do
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
end
