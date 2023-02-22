# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  version2_arr = version2.split('.')
  version1.split('.').each_with_index do |num, index|
    case num.to_i <=> version2_arr[index].to_i
    when 1
      return 1
    when -1
      return -1
    end
  end
  0
end
# END
