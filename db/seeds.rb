# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StatusMaster.create(id: 1, state: '申請')
StatusMaster.create(id: 2, state: '承認')
StatusMaster.create(id: 3, state: '拒否')
StatusMaster.create(id: 4, state: '評価待ち')
StatusMaster.create(id: 5, state: '終了')

SkillMaster.create(id: 1, skilltype: 'C#')
SkillMaster.create(id: 2, skilltype: 'PHP')
SkillMaster.create(id: 3, skilltype: 'Java')
SkillMaster.create(id: 4, skilltype: 'Ruby')
SkillMaster.create(id: 5, skilltype: 'HTML')
SkillMaster.create(id: 6, skilltype: 'CSS')
SkillMaster.create(id: 7, skilltype: 'JavaSclipt')

#User.create(id: 1, name: '山田',tel: 000-2222-1111, mail: 'yamada@yama.com' pass: )
