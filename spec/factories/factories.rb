FactoryGirl.define do
  factory :player do
    id 1
    email 'example@example.pl'
    password 'example123'
    firstname 'Adam'
    lastname 'Nowak'
  end

  factory :match do
    first_player_id 1
    second_player_id 2
    first_player_score 10
    second_player_score 8
    date "2015-03-25"
  end
end
