# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create(id: 1,
            name: "admin")

AdminUser.delete_all
AdminUser.create(id: 1,
                 email: "admin@admin.com",
                 password: "11111111",
                 password_confirmation: "11111111")


# class RolesAdmin_users < ActiveRecord::Base; end
# RolesAdmin_users.delete_all

# Role.find_by(name: "admin").admin_users << AdminUser.find_by(email: "admin@admin.com")



Member.delete_all
Member.create(id: 1,
              email: "guest@guest.com",
              password: "11111111",
              password_confirmation: "11111111")
Member.create(id: 2,
              email: "guest2@guest.com",
              password: "11111111",
              password_confirmation: "11111111")


Rsslist.delete_all
Rsslist.create(url: "http://news.yahoo.co.jp/pickup/rss.xml",
               member_id: 1)
Rsslist.create(url: "http://feedjira.com/blog/feed.xml",
               member_id: 1)
Rsslist.create(url: "http://toianna.hatenablog.com/",
               member_id: 1)
Rsslist.create(url: "http://news.yahoo.co.jp/pickup/rss.xml",
               member_id: 2)
Rsslist.create(url: "http://toianna.hatenablog.com/",
               member_id: 2)
# Rsslist.transaction do
#   20.times do
#     Rsslist.create(url: "http://test.com",
#                    member_id: [1,2].sample)

#   end
# end

class AdminUsersRoles < ActiveRecord::Base; end
AdminUsersRoles.delete_all
AdminUsersRoles.create(admin_user_id: 1,
                       role_id: 1)

# AdminUsersRoles.find_by(name: "admin").admin_users << AdminUser.find_by(email: "admin@admin.com")