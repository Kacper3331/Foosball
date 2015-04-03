FactoryGirl.define do
  factory :player do
    id 1
    email 'example@example.pl'
    password 'example123'
    firstname 'Adam'
    lastname 'Nowak'
  end

  factory :second_player, class: Player do
    id 2
    email 'second_example@example.pl'
    password 'example123'
    firstname 'Jan'
    lastname 'Kowalski'
  end

  factory :match do
    first_player_score 10
    second_player_score 8
    date "2015-03-25"
    association :players, factory: :player
  end
end
