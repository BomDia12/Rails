genders = ['Pop', 'Rock', 'Indie', 'Rap', 'Brazilian', 'Kpop', 'Classical', 'Alternative']

genders.each do |gender|
  MusicalGender.create(name: gender)
end
