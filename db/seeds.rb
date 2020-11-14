# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Transaction.delete_all

csv_text = File.read(Rails.root.join('db','cinematransactions.csv'))
csv = CSV.parse(csv_text, :headers => true, col_sep: ";")
csv.each do |row|
  Transaction.create! row.to_hash.except!(*%{latitude})
  # each row will be a hash object. Use the data in this hash object to create records in the DB.
end