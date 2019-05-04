# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#quests = Quest.all;
#for i in 1003..1000000
# quest = Quest.new(task: "Quest#{i}", reward: 10, description: 'test')
#  quest.save
#  users_quest = UsersQuest.new(user_id: 4,
#                                quest_id: quest.id, status: 0)
#  users_quest.save
#
#  users_quest = UsersQuest.new(user_id: 4,
#                                quest_id: quest.id, status: 1)
#  users_quest.save
# end
#
#


con = PG.connect dbname: 'dbs_development' , user: 'majka', password: 'Leafeon'

con.exec 'INSERT INTO users (name, password, email, level, score, created_at, updated_at)
SELECT concat(\'User \', i), concat(\'Heslo \', i), concat(\'User\', i,\'@mail.com\',), floor(random() * 100 + 1), floor(random() * 1000), now(), now()
FROM generate_series(1, 1000000) s(i);'

con.exec 'INSERT INTO quests (task, description, reward)
SELECT concat(\'Quest \', i),concat(\'test\'), floor(random() * 100 + 1) FROM generate_series(1, 1000000) s(i);'

con.exec 'INSERT INTO users_quests (user_id, quest_id, status, created_at, updated_at)
SELECT floor(random() * 8 + 2), floor(random() * 1000000 + 1), floor(random() * 3), now(), now()
FROM generate_series(1, 1000000) s(i);'