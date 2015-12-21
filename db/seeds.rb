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
AdminUser.create(email: "admin@admin.com",
                 password: "11111111",
                 password_confirmation: "11111111")


# class RolesAdmin_users < ActiveRecord::Base; end
# RolesAdmin_users.delete_all

# Role.find_by(name: "admin").admin_users << AdminUser.find_by(email: "admin@admin.com")



Member.delete_all
Member.create(email: "guest@guest.com",
                 password: "11111111",
                 password_confirmation: "11111111")


#  id         :integer          not null, primary key
#  url        :string
#  member_id  :integer

Rsslist.delete_all

Rsslist.transaction do
  20.times do
    Rsslist.create(:url => "http://test.com")
  end
end
