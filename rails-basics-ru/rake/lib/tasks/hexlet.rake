namespace :hexlet do
  desc "Import users from csv file"
  task :import_users, [:path] => :environment do |task, args|
    require 'csv'
    arr_of_keys = [:first_name, :last_name, :birthday, :email]
    CSV.foreach(args[:path], headers: true, header_converters: :symbol) do |row|
      user = User.new
      arr_of_keys.each do |key|
        user[key] = if key.equal? :birthday
                      Date.strptime(row[key], "%m/%d/%Y")
                    else
                      row[key]
                    end
      end
      user.save
    end
  end
end
