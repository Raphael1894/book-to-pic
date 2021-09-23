namespace :perform do

  task perform: :environment do
    require "rake"
    puts "** Creation started **".yellow

    puts "**************"
    puts "** All done **".green
  end

  task generate_db: :environment do
    require "rake"
    Rake::Task["import_data:import_frequencies"].invoke
    puts "** Frequencies imported **".cyan
    Rake::Task["import_data:import_names"].invoke
    puts "** Names imported **".cyan
    Rake::Task["import_data:import_text"].invoke
    puts "** Text imported **".cyan
    puts "** All done importing data **".green
  end

  task generate_colors: :environment do
    require "rake"
    Rake::Task["colors:allocate_colors_to_frequencies"].invoke
    puts "** Frequencies colors allocated **".cyan
    Rake::Task["colors:allocate_colors_to_names"].invoke
    puts "** Names colors allocated **".cyan
    Rake::Task["colors:allocate_colors_to_numbers"].invoke
    puts "** Numbers colors allocated **".cyan
    puts "** All done allocation colors **".green
  end

  task import_book: :environment do
    require "rake"
    Rake::Task["import_data:import_text"].invoke
    puts "** All done importing book **".green
  end

  task create_picture: :environment do
    require "rake"
    Rake::Task["book_to_pic:color_text"].invoke
    puts "** Text color allocated **".cyan
    Rake::Task["book_to_pic:create_image"].invoke
    puts "** Image generated **".cyan
    puts "** All done creating picture **".green
  end

  task everything: :environment do
    require "rake"
    puts "** Creation started **".yellow
    Rake::Task["perform:generate_db"].invoke
    Rake::Task["perform:generate_colors"].invoke
    Rake::Task["perform:import_book"].invoke
    Rake::Task["perform:create_picture"].invoke
    puts "**************"
    puts "** All done **".green
  end
end
