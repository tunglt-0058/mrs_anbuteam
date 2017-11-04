User.create!([
  {email: "admin@gmail.com", name: "Admin",
    password: "12345678", password_confirmation: "12345678"},
  {email: "letattungtb@gmail.com", name: "Le Tat Tung",
    password: "tung123", password_confirmation: "tung123"}
])

Admin.create!([
  {email: "admin@gmail.com",
    password: "12345678", password_confirmation: "12345678"}
])

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

Genre.create!([
  {name: "Action"},
  {name: "Adventure"},
  {name: "Comedy"},
  {name: "Ecchi"},
  {name: "Fantasy"},
  {name: "Historical"},
  {name: "Horror"},
  {name: "Josei"},
  {name: "Magic"},
  {name: "Mecha"},
  {name: "Military"},
  {name: "Music"},
  {name: "Mystery"},
  {name: "Psychological"},
  {name: "Romance"},
  {name: "School"},
  {name: "Sci-fi"}
])

Movie.create!([
  {name: "5 Centimeters per Second", episodes: 3,status:"Completed",
    summary: "This is the story of two close friends, Toono Takaki and
    Shinohara Akari, who became separated by space and time.
    ", poster: "http://i.imgur.com/sVwhZDz.jpg"},
  {name: "Shelter", episodes: 12,status:"Ongoing",
    summary: "Rin, a 17-year-old girl, lives inside a futuristic simulator in
      infinite, beautiful loneliness. Each day, she awakens in virtual reality
      to create a world for herself, yet in real life, Rin's comatose body
      floats through the universe, forever trapped insid (...)",
    poster: "http://i.imgur.com/4umw50Hg.png"},
  {name: "Occultic;Nine", episodes: 12,status:"Completed",
    summary: "The \"paranormal science\" story follows nine idiosyncratic
    individuals, linked by the \"Choujou Kagaku Kirikiri Basara\" occult summary
      blog run by 17-year-old second-year high school student Yuuta Gamon.
      Little incongruities that occur around these nine even (...)",
    poster: "http://i.imgur.com/8F3FSUm.jpg"},
  {name: "Mushishi", episodes: 1,status:"Completed",
    summary: "\"Mushi\": the most basic forms of life in the world. They exist
      without any goals or purposes aside from simply \"being.\" They are beyond
      the shackles of the words \"good\" and \"evil.\" Mushi can exist in countless
      forms and are capable of mimicking things from (...)",
    poster: "https://s-media-cache-ak0.pinimg.com/originals/f1/55/29/f1552987d45479963b66022b14472540.jpg"},
  {name: "Bakemono no Ko", episodes: 1,status:"Completed",
    summary: "Bakemono no Ko is the tale of a boy and a beast: both lonely,
    both stubborn, and both strong. For nine-year-old Ren, things could hardly
    be worse. His mother has passed away in a traffic accident,
    his father is nowhere to be found, and his extended family  (...)",
    poster: "https://upload.wikimedia.org/wikipedia/en/c/c4/The_Boy_and_the_Beast_poster.jpg"},
  {name: "Kimi no Na wa", episodes: 1,status:"Completed",
    summary: "Mitsuha Miyamizu, a high school girl, yearns to live the life of
    a boy in the bustling city of Tokyo—a dream that stands in stark contrast
    to her present life in the countryside. Meanwhile in the city,
    Taki Tachibana lives a busy life as a high school stud (...)",
    poster: "http://img10.deviantart.net/1c62/i/2016/278/1/5/_4k_uhd__kimi_no_na_wa_by_assassinwarrior-dajydsn.jpg"},
  {name: "Shouwa Genroku Rakugo Shinjuu", episodes: 1,status:"Completed",
    summary: "Yotarou is a former yakuza member fresh out of prison and fixated
      on just one thing: rather than return to a life of crime, the young man
      aspires to take to the stage of Rakugo, a traditional Japanese form of
      comedic storytelling. Inspired during his incar (...)",
    poster: "http://2.bp.blogspot.com/-Kcg7JwCnHiE/VqgkujnvZCI/AAAAAAAADJ8/T7zmsn03GgU/s640/shouwa%2Bgenroku%2Brakugo%2Bshinjuu.jpg"},
  {name: "Kotonoha no Niwa", episodes: 1,status:"Completed",
    summary: "On a rainy morning in Tokyo, Takao Akizuki, an aspiring
    shoemaker, decides to skip class to sketch designs in a beautiful garden.
    This is where he meets Yukari Yukino, a beautiful yet mysterious woman,
    for the very first time. Offering to make her new shoe (...)",
    poster: "https://s-media-cache-ak0.pinimg.com/originals/6e/7a/e2/6e7ae2b1f1d7d64969404fb4609e9b59.jpg"},
  {name: "Ghost in the Shell", episodes: 1,status:"Completed",
    summary: "In the year 2029, advances in Cybernetics allow people to replace
    nearly all of their body parts and organs with robotics. Through these
    prosthetics, the weak are made strong, and the dying are given new life.
    Public Security Section 9 of Niihama City (a f (...)",
    poster: "http://68.media.tumblr.com/bbf0183b4e3d85f806930d0dbc4dc756/tumblr_n9c3rc55Bp1qbluruo2_r1_1280.jpg"},
  {name: "Koe no Katachi", episodes: 1,status:"Completed",
    summary: "Ishida Shouya bullies a deaf girl, Nishimiya Shouko, to the point
    that she transfers to another school. As a result, he is ostracized and
    bullied himself with no friends to speak of and no plans for the future.
    This is the story of his path to redemptio (...)",
    poster: "https://c2.staticflickr.com/8/7545/26678893374_ff427f0760_b.jpg"}
])

MovieGenre.create!([
  {genre_id: 1, movie_id: 1},
  {genre_id: 1, movie_id: 2},
  {genre_id: 1, movie_id: 3},
  {genre_id: 1, movie_id: 4},
  {genre_id: 1, movie_id: 5},
  {genre_id: 2, movie_id: 6},
  {genre_id: 2, movie_id: 2},
  {genre_id: 2, movie_id: 3},
  {genre_id: 2, movie_id: 4},
  {genre_id: 2, movie_id: 5},
  {genre_id: 3, movie_id: 10},
  {genre_id: 3, movie_id: 2},
  {genre_id: 3, movie_id: 3},
  {genre_id: 3, movie_id: 8},
  {genre_id: 3, movie_id: 5},
  {genre_id: 4, movie_id: 1},
  {genre_id: 4, movie_id: 9},
  {genre_id: 4, movie_id: 3},
  {genre_id: 4, movie_id: 4},
  {genre_id: 4, movie_id: 5},
  {genre_id: 5, movie_id: 7},
  {genre_id: 5, movie_id: 2},
  {genre_id: 5, movie_id: 3},
  {genre_id: 5, movie_id: 4},
  {genre_id: 5, movie_id: 5},
  {genre_id: 6, movie_id: 10},
  {genre_id: 7, movie_id: 2},
  {genre_id: 7, movie_id: 3},
  {genre_id: 7, movie_id: 5},
  {genre_id: 7, movie_id: 8},
  {genre_id: 8, movie_id: 1},
  {genre_id: 8, movie_id: 2},
  {genre_id: 8, movie_id: 6},
  {genre_id: 8, movie_id: 4},
  {genre_id: 8, movie_id: 8},
  {genre_id: 9, movie_id: 1},
  {genre_id: 9, movie_id: 2},
  {genre_id: 9, movie_id: 9},
  {genre_id: 9, movie_id: 4},
  {genre_id: 9, movie_id: 10},
  {genre_id: 10, movie_id: 1},
  {genre_id: 10, movie_id: 2},
  {genre_id: 10, movie_id: 6},
  {genre_id: 10, movie_id: 4},
  {genre_id: 10, movie_id: 5},
  {genre_id: 11, movie_id: 7},
  {genre_id: 11, movie_id: 10},
  {genre_id: 11, movie_id: 3},
  {genre_id: 11, movie_id: 4},
  {genre_id: 11, movie_id: 5},
  {genre_id: 12, movie_id: 9},
  {genre_id: 12, movie_id: 2},
  {genre_id: 12, movie_id: 3},
  {genre_id: 12, movie_id: 8},
  {genre_id: 13, movie_id: 5},
  {genre_id: 14, movie_id: 1},
  {genre_id: 15, movie_id: 10},
  {genre_id: 15, movie_id: 3},
  {genre_id: 16, movie_id: 6},
  {genre_id: 17, movie_id: 8}
])

FavoriteMovie.create!([
  {user_id: 1, movie_id: 1},
  {user_id: 1, movie_id: 2},
  {user_id: 1, movie_id: 3},
  {user_id: 1, movie_id: 4},
  {user_id: 1, movie_id: 5},
  {user_id: 2, movie_id: 6},
  {user_id: 2, movie_id: 2},
  {user_id: 2, movie_id: 3},
  {user_id: 2, movie_id: 4},
  {user_id: 2, movie_id: 5},
  {user_id: 3, movie_id: 10},
  {user_id: 3, movie_id: 2},
  {user_id: 3, movie_id: 3},
  {user_id: 3, movie_id: 8},
  {user_id: 3, movie_id: 5},
  {user_id: 4, movie_id: 1},
  {user_id: 4, movie_id: 9},
  {user_id: 4, movie_id: 3},
  {user_id: 4, movie_id: 4},
  {user_id: 4, movie_id: 5},
  {user_id: 5, movie_id: 7},
  {user_id: 5, movie_id: 2},
  {user_id: 5, movie_id: 3},
  {user_id: 5, movie_id: 4},
  {user_id: 5, movie_id: 5},
  {user_id: 6, movie_id: 10},
  {user_id: 7, movie_id: 2},
  {user_id: 7, movie_id: 3},
  {user_id: 7, movie_id: 5},
  {user_id: 7, movie_id: 8},
  {user_id: 8, movie_id: 1},
  {user_id: 8, movie_id: 2},
  {user_id: 8, movie_id: 6},
  {user_id: 8, movie_id: 4},
  {user_id: 8, movie_id: 8},
  {user_id: 9, movie_id: 1},
  {user_id: 9, movie_id: 2},
  {user_id: 9, movie_id: 9},
  {user_id: 9, movie_id: 4},
  {user_id: 9, movie_id: 10},
  {user_id: 10, movie_id: 1},
  {user_id: 10, movie_id: 2},
  {user_id: 10, movie_id: 6},
  {user_id: 10, movie_id: 4},
  {user_id: 10, movie_id: 5}
])

FavoriteActor.create!([
  {user_id: 1, actor_id: 1},
  {user_id: 1, actor_id: 2},
  {user_id: 1, actor_id: 3},
  {user_id: 1, actor_id: 4},
  {user_id: 1, actor_id: 5},
  {user_id: 2, actor_id: 1},
  {user_id: 2, actor_id: 3},
  {user_id: 2, actor_id: 5},
  {user_id: 2, actor_id: 7},
  {user_id: 3, actor_id: 9},
  {user_id: 3, actor_id: 11},
  {user_id: 3, actor_id: 12},
  {user_id: 3, actor_id: 13},
  {user_id: 4, actor_id: 14},
  {user_id: 4, actor_id: 2},
  {user_id: 4, actor_id: 4},
  {user_id: 5, actor_id: 6},
  {user_id: 5, actor_id: 8},
  {user_id: 5, actor_id: 10},
  {user_id: 6, actor_id: 12},
  {user_id: 6, actor_id: 14},
  {user_id: 6, actor_id: 15},
  {user_id: 7, actor_id: 1},
  {user_id: 7, actor_id: 2},
  {user_id: 7, actor_id: 3},
  {user_id: 7, actor_id: 5},
  {user_id: 8, actor_id: 8},
  {user_id: 8, actor_id: 13},
  {user_id: 8, actor_id: 3},
  {user_id: 9, actor_id: 5},
  {user_id: 9, actor_id: 8},
  {user_id: 9, actor_id: 9},
  {user_id: 10, actor_id: 2},
  {user_id: 10, actor_id: 6}
])

Actor.create!([
  {name: "Arimura Kasumi", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/P4J77s7.jpg"},
  {name: "Anne Watanabe", date_of_birth: "10/6/1992", avatar: "https://i.imgur.com/BLPPpN8.jpg"},
  {name: "Toma Ikuta", date_of_birth: "13/8/1995", avatar: "https://i.imgur.com/NTmN8D9.jpg"},
  {name: "Rena Nōnen", date_of_birth: "13/2/1995", avatar: "https://i.imgur.com/Os2JCR8.jpg"},
  {name: "Satomi Ishihara", date_of_birth: "12/2/1995", avatar: "https://i.imgur.com/lFXzxeA.jpg"},
  {name: "Fumi Nikaido", date_of_birth: "12/4/1995", avatar: "https://i.imgur.com/Qit2Uck.jpg"},
  {name: "Sato Takeru", date_of_birth: "10/6/1995", avatar: "https://i.imgur.com/L2ulGv1.jpg"},
  {name: "Yamashita Tomohisa", date_of_birth: "19/8/1993", avatar: "https://i.imgur.com/trCGIFA.jpg"},
  {name: "Yoshitaka Yuriko", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/zs8tqPB.jpg"},
  {name: "Matsu Takako", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/q7YOTnM.jpg"},
  {name: "Matsumoto Jun", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/BLPPpN8.jpg"},
  {name: "Takahata Mitsuki", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/nqNcUUI.jpg"},
  {name: "Ayase Haruka", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/guOuRwF.jpg"},
  {name: "Takei Emi", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/1CjGz93.jpg"},
  {name: "Hiro Mizushima", date_of_birth: "10/8/1995", avatar: "https://i.imgur.com/Os2JCR8.jpg"}
])

MovieActor.create!([
  {movie_id: 1, actor_id: 1},
  {movie_id: 1, actor_id: 3},
  {movie_id: 1, actor_id: 5},
  {movie_id: 2, actor_id: 2},
  {movie_id: 2, actor_id: 4},
  {movie_id: 2, actor_id: 6},
  {movie_id: 3, actor_id: 3},
  {movie_id: 3, actor_id: 5},
  {movie_id: 3, actor_id: 7},
  {movie_id: 4, actor_id: 8},
  {movie_id: 4, actor_id: 9},
  {movie_id: 4, actor_id: 10},
  {movie_id: 5, actor_id: 6},
  {movie_id: 5, actor_id: 8},
  {movie_id: 5, actor_id: 10},
  {movie_id: 6, actor_id: 1},
  {movie_id: 6, actor_id: 4},
  {movie_id: 6, actor_id: 9},
  {movie_id: 7, actor_id: 2},
  {movie_id: 7, actor_id: 3},
  {movie_id: 7, actor_id: 5},
  {movie_id: 8, actor_id: 6},
  {movie_id: 8, actor_id: 7},
  {movie_id: 8, actor_id: 8},
  {movie_id: 9, actor_id: 2},
  {movie_id: 9, actor_id: 5},
  {movie_id: 9, actor_id: 6},
  {movie_id: 10, actor_id: 7},
  {movie_id: 10, actor_id: 8},
  {movie_id: 10, actor_id: 10},
  {movie_id: 1, actor_id: 11},
  {movie_id: 1, actor_id: 12},
  {movie_id: 2, actor_id: 13},
  {movie_id: 2, actor_id: 14},
  {movie_id: 2, actor_id: 11},
  {movie_id: 3, actor_id: 12},
  {movie_id: 3, actor_id: 13},
  {movie_id: 4, actor_id: 14},
  {movie_id: 4, actor_id: 12},
  {movie_id: 5, actor_id: 15},
  {movie_id: 6, actor_id: 13},
  {movie_id: 6, actor_id: 14},
  {movie_id: 8, actor_id: 11},
  {movie_id: 9, actor_id: 14},
  {movie_id: 9, actor_id: 13},
  {movie_id: 9, actor_id: 15},
  {movie_id: 10, actor_id: 15},
  {movie_id: 10, actor_id: 13},
  {movie_id: 10, actor_id: 12}
])

Category.create!([
  {name: "male protagonist"},
  {name: "childhood promise"},
  {name: "daily life"},
  {name: "contemporary fantasy"},
  {name: "feel"},
  {name: "multiple protagonists"},
  {name: "countryside"},
  {name: "watercolour style"},
  {name: "heart-warming"},
  {name: "fighting"}
])

MovieCategory.create!([
  {movie_id: 1, category_id: 1},
  {movie_id: 1, category_id: 2},
  {movie_id: 2, category_id: 3},
  {movie_id: 2, category_id: 4},
  {movie_id: 3, category_id: 5},
  {movie_id: 3, category_id: 6},
  {movie_id: 4, category_id: 7},
  {movie_id: 4, category_id: 8},
  {movie_id: 5, category_id: 9},
  {movie_id: 5, category_id: 10},
  {movie_id: 6, category_id: 10},
  {movie_id: 6, category_id: 8},
  {movie_id: 7, category_id: 6},
  {movie_id: 7, category_id: 4},
  {movie_id: 8, category_id: 2},
  {movie_id: 8, category_id: 1},
  {movie_id: 9, category_id: 3},
  {movie_id: 9, category_id: 5},
  {movie_id: 10, category_id: 7},
  {movie_id: 10, category_id: 9}
])

Movie.all.each do |movie|
  Review.create! movie_id: movie.id, user_id: 1, point: 5,
    content: "オタロウは旧刑務所に所属していた元ヤクザのメンバーで、犯罪に復帰するのではなく,
      伝統的な日本語のコメディストーリーテイストの落語に憧れている。 彼の収縮期に
      インスピレーションを受けた"
  movie.point = 5
  movie.save
end

Review.all.each do |review|
  (1..5).each do
    comment = Comment.create user_id: 1, review_id: review.id,
      content: "この映画は映像の美しさといい音楽の素晴らしさといい、最高の作品だ。"
    Comment.create user_id: 2, review_id: review.id, parent_id: comment.id,
    content: "そうですね。本当に面白いです。"
  end
end

Review.all.each do |review|
  Activity.create user_id: 2, review: review, activity_type: :like
  Activity.create user_id: 3, review: review, activity_type: :like
  Activity.create user_id: 4, review: review, activity_type: :dislike
  Activity.create user_id: 5, review: review, activity_type: :dislike
end
