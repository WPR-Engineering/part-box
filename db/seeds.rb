# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when "development"

Part.create(internal_part: 'P-PC-001', mfg_part: 'AT-01-OR', name: 'Patch Cable', description: '1ft orage cable', manufacturer: 'AllenTel')
Part.create(internal_part: 'P-PC-002', mfg_part: 'AT-03-OR', name: 'Patch Cable', description: '3ft orage cable', manufacturer: 'AllenTel')
Part.create(internal_part: 'P-PC-003', mfg_part: 'AT-05-OR', name: 'Patch Cable', description: '5ft orage cable', manufacturer: 'AllenTel')
Part.create(internal_part: 'P-PC-004', mfg_part: 'AT-07-OR', name: 'Patch Cable', description: '7ft orage cable', manufacturer: 'AllenTel')

Location.create(name: 'Unassigned')
Location.create(name: 'Vilas')
Location.create(name: 'DoIT')
Location.create(name: 'EAU')
Location.create(name: 'GBY')


when "production"
Location.create(name: 'Unassigned')

end
