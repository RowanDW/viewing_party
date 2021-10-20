# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "'Star" Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Friendship.destroy_all
User.destroy_all

@user_1 = User.create!(name: "tester", email: 'test12@test.com', password: 'test')
@user_2 = User.create!(name: "elmer", email: 'elmer@test.com', password: 'test')
@user_3 = User.create!(name: "bugs", email: 'bugs@test.com', password: 'test')
@user_4 = User.create!(name: "daffy", email: 'daffy@test.com', password: 'test')

@user_1.friends.push(@user_2, @user_3)

# Friendship.create!(user: @user_1, friend: @user_2)
