# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user テーブル
User.create(id: 1,name: 'kawabata',tel: '000-000-0000',mail_address: 'kawabata@oo.com',password_digest: 'kawapass',created_at:'',updated_at: '',usertype: 0)
User.create(id: 2,name: 'nagai',tel: '000-000-0000',mail_address: 'nagai@oo.com',password_digest: 'nagaipass',created_at:'',updated_at: '',usertype: 0)
User.create(id: 3,name: 'kawamoto',tel: '000-000-0000',mail_address: 'kawamoto@oo.com',password_digest: 'kawamotopass',created_at:'',updated_at: '',usertype: 0)
User.create(id: 4,name: 'gotou',tel: '000-000-0000',mail_address: 'gotou@oo.com',password_digest: 'gotoupass',created_at:'',updated_at: '',usertype: 0)
User.create(id: 5,name: 'yamada',tel: '000-000-0000',mail_address: 'yamada@oo.com',password_digest: 'yamadapass',created_at:'',updated_at: '',usertype: 0)

# Company テーブル
Companies.create(user_id: 1,companyname: 'フロイデ商店',created_at: '',updated_at: '')
Companies.create(user_id: 2,companyname: '川元商店',created_at: '',updated_at: '')
Companies.create(user_id: 3,companyname: '川端商店',created_at: '',updated_at: '')
Companies.create(user_id: 4,companyname: '永井商店',created_at: '',updated_at: '')
Companies.create(user_id: 5,companyname: '後藤商店',created_at: '',updated_at: '')

# Skill テーブル
Skill.create(user_id: 1,skill_master_id: 1,created_at: '',updated_at: '')
Skill.create(user_id: 2,skill_master_id: 1,created_at: '',updated_at: '')
Skill.create(user_id: 3,skill_master_id: 1,created_at: '',updated_at: '')
Skill.create(user_id: 4,skill_master_id: 1,created_at: '',updated_at: '')
Skill.create(user_id: 5,skill_master_id: 1,created_at: '',updated_at: '')

# SkillMaster テーブル
SkillMaster.create(id: 1, skilltype: 'C#')
SkillMaster.create(id: 2, skilltype: 'PHP')
SkillMaster.create(id: 3, skilltype: 'Java')
SkillMaster.create(id: 4, skilltype: 'Ruby')
SkillMaster.create(id: 5, skilltype: 'HTML')
SkillMaster.create(id: 6, skilltype: 'CSS')
SkillMaster.create(id: 7, skilltype: 'JavaSclipt')

# Status テーブル
Status.create(id: 1,user_id:1,company_id:1,skill_master_id: 3,status_master_id: 4,date:"2018-06-19",score:40,created_at:'',updated_at:'')
Status.create(id: 1,user_id:1,company_id:2,skill_master_id: 4,status_master_id: 4,date:"2018-06-19",score:60,created_at:'',updated_at:'')
Status.create(id: 1,user_id:1,company_id:3,skill_master_id: 5,status_master_id: 4,date:"2018-06-19",score:100,created_at:'',updated_at:'')
Status.create(id: 1,user_id:1,company_id:4,skill_master_id: 6,status_master_id: 4,date:"2018-06-19",score:70,created_at:'',updated_at:'')
Status.create(id: 1,user_id:1,company_id:5,skill_master_id: 7,status_master_id: 4,date:"2018-06-19",score:30,created_at:'',updated_at:'')

# StatusMaster テーブル
StatusMaster.create(id: 1, state: '申請')
StatusMaster.create(id: 2, state: '承認')
StatusMaster.create(id: 3, state: '拒否')
StatusMaster.create(id: 4, state: '評価待ち')
StatusMaster.create(id: 5, state: '終了')

# freedays テーブル
Freeday.create(user_id: 1,begin: '2018-06-25',end: '2018-07-10',created_at: '',updated_at: '')
Freeday.create(user_id: 2,begin: '2018-07-15',end: '2018-07-20',created_at: '',updated_at: '')
Freeday.create(user_id: 3,begin: '2018-07-18',end: '2018-08-01',created_at: '',updated_at: '')
Freeday.create(user_id: 4,begin: '2018-08-13',end: '2018-08-21',created_at: '',updated_at: '')
Freeday.create(user_id: 5,begin: '2018-05-10',end: '2018-05-20',created_at: '',updated_at: '')


