# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding the database example from newline:
# ALPHABET = ('a'..'z').to_a
# PATTERNS = %w(solid bi-color tabby calico tortoiseshell)
# COLORS   = %w(white black brown blue ginger)
#
# 100.times do
#   Cat.create!(
#     name:         ALPHABET.sample(8).join.capitalize,
#     coat_pattern: PATTERNS.sample,
#     coat_color:   COLORS.sample
#   )
# end

require 'csv'

# CSV.foreach('lib/20171017_additional_plants.csv', :headers => true, encoding: 'iso-8859-1:utf-8') do |row|
#   Plant.create!(row.to_hash)
# end

# CSV.foreach('lib/users_short.csv', :headers => true, encoding: 'iso-8859-1:utf-8') do |row|
#   @user = User.create!(row.to_hash)
#   # uncomment db_seed method in User model to set to activated.
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
