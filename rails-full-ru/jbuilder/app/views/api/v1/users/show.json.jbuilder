json.extract! @user, :id, :email, :address

json.full_name "#{@user.first_name} #{@user.last_name}"

json.posts do
  json.partial!  partial: 'posts', collection: @user.posts, as: :post
end