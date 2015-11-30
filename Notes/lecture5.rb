# crud = create, read, update, destroy

rails g migration AddImage

rake db:drop
# kills migration file

p = Pokemon.create(name:'Pikachu', occupation: 'Pokemon')