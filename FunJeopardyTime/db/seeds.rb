# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
f = File.open("../trivia-questions.txt", "r")
game = Game.create!(name: 'FirstGame', score: 0)
persisted_categories = {}

f.each_line do |line|
  next if line.match(/^$/)

  a = eval line


  a[:results].each do |hash|
    if persisted_categories.has_key?(hash[:category])
      cat = Category.find_by(name: hash[:category])
    else
      cat = Category.create!(name: hash[:category], kind: hash[:type], game: game)
      persisted_categories[hash[:category]] = cat.name
    end

    quest = Question.create!(category: cat, text: hash[:question], difficulty: hash[:difficulty])
    Answer.create!(question: quest, text: hash[:correct_answer], correct: true)
    hash[:incorrect_answers].each do |answer|
      Answer.create!(question: quest, text: answer, correct: false)
    end
  end
end


puts persisted_categories





#   Category.where(name: cat).each_with_index do |category, index|
#     category.destroy! unless index == 0
#   end
# end

# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :string
#  correct     :boolean
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
#
# {:category=>"General Knowledge",
#  :type=>"multiple",
#  :difficulty=>"easy",
#  :question=>
#    "Where is the train station &quot;Llanfair&shy;pwllgwyngyll&shy;gogery&shy;chwyrn&shy;drobwll&shy;llan&shy;tysilio&shy;gogo&shy;goch&quot;?",
#  :correct_answer=>"Wales",
#  :incorrect_answers=>["Moldova", "Czech Republic", "Denmark"]},