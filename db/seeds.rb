Answer.destroy_all
UserBoard.destroy_all
Admin.destroy_all

Admin.create! email: 'admin@admin.com', password: 'topsecret', password_confirmation: 'topsecret'
Admin.create! email: 'second_admin@admin.com', password: 'topsecret', password_confirmation: 'topsecret'

first_names = %w(Andy Max John George Oliver Jack)
last_names  = %w(Smith Hill Adams Baker Davis Bowie)
user_board_count = 12


question = %w(Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.)
user_board_count.times do
  first_name = first_names.sample
  last_name = last_names.sample
  UserBoard.create!(
    name:  "#{first_name} #{last_name}",
    email: "#{first_name}@#{last_name}.com".downcase,
    question: question.sample(1 + rand(question.count)).join(' ')
  )
end