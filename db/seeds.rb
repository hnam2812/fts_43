3.times do
  name = Faker::Lorem.sentence
  subject = Subject.create! name: name

  15.times do
    question = subject.questions.build content: Faker::Lorem.characters(5)
    question.type = 0
    question.user_id = User.order("RANDOM()").limit 1
      question.answers = [
        Answer.new(content: Faker::Lorem.characters(5), is_correct: true),
        Answer.new(content: Faker::Lorem.characters(5), is_correct: false),
        Answer.new(content: Faker::Lorem.characters(5), is_correct: false),
        Answer.new(content: Faker::Lorem.characters(5), is_correct: false)
      ].shuffle
    question.save!
  end
end
