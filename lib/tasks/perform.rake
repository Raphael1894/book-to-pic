namespace :perform do

  task create: :environment do
    require "rake"
    puts "** Creation started **".yellow
    Rake::Task["fluid_colors:numbers"].invoke
    puts "** Numbers created and colored **".cyan
    Rake::Task["spiral:numbers"].invoke
    puts "** Image numbers generated **".cyan
    Rake::Task["import_data:import_text"].invoke
    puts "** Text imported **".cyan
    Rake::Task["fluid_colors:texts"].invoke
    puts "** Text color allocated **".cyan
    Rake::Task["spiral:texts"].invoke
    puts "** Image texts generated **".cyan
    UserMailer.welcome_email.deliver_now
    puts "**************"
    puts "** All done **".green
  end

  task generate_db: :environment do
    require "rake"
    Rake::Task["import_data:import_frequencies"].invoke
    puts "** Frequencies imported **".cyan
    Rake::Task["import_data:import_names"].invoke
    puts "** Names imported **".cyan
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
    UserMailer.welcome_email.deliver_now
    puts "**************"
    puts "** All done **".green
  end




  task new: :environment do
    require "rake"
    puts "** Creation started **".yellow
    #Rake::Task["colors:allocate_colors_to_frequencies"].invoke
    #puts "** Frequencies colors allocated **".cyan
    Rake::Task["colors:allocate_colors_to_numbers"].invoke
    puts "** Numbers colors allocated **".cyan
    Rake::Task["book_to_pic:color_text"].invoke
    puts "** Text color allocated **".cyan
    Rake::Task["book_to_pic:create_image"].invoke
    puts "** Image generated **".cyan
    UserMailer.welcome_email.deliver_now
    Rake::Task["colors:test_frequencies_colors"].invoke
    puts "** Frequencies colors image generated **".cyan
    Rake::Task["colors:test_numbers_colors"].invoke
    puts "** Numbers colors image generated **".cyan
    UserMailer.welcome_email.deliver_now
    puts "**************"
    puts "** All done **".green
  end
end
