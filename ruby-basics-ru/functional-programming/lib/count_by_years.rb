# frozen_string_literal: true

# BEGIN
def count_by_years(user_arr)
  user_arr.filter { |elem| elem[:gender] == 'male' }
          .each_with_object({}) do |user, males_by_years|
            year = user[:birthday].slice(0..3)
            males_by_years[year] ||= 0
            males_by_years[year] += 1
          end
end
# END
