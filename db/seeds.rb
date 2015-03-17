puts 'Purging images table...'
Image.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('images')

puts 'Seeding images...'

titles = ['Matahari terbenam ',
  'Bandung berawan',
  'Keluarga Indonesiaku',
  'Teriakan sang ibu',
  'Matahari terbit',
  'Terngiang dikepalaku',
  'Jalan setapak',
  'Dibalik hilangnya uang',
  'Motor tercepat di RT01',
  'Kaca tembus pandang',
  'Gelas anti tumpah',
  'Pulpen tak habis - habis']

descriptions = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
  "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
  "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
  "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
  'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.',
  'This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."]

titles.each_with_index do |title, index|
  Image.create(:title => title, :description => descriptions[index], :data => File.open(File.join(Rails.root, "db/seed_data/#{index + 1}.jpg")))
end

puts 'Everything done!'
