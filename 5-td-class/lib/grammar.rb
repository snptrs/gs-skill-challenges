class GrammarStats
  def initialize
    @total_checks = 0
    @passed_checks = 0
  end

  def check(text) # text is a string
    @total_checks += 1
    # p "@total_checks = #{@total_checks}"
    result = /^[A-Z].*[.?!]/ =~ text
    # p "Result is #{result}"
    @passed_checks +=1 if result != nil
    # p "@passed_checks = #{@passed_checks}"
    result != nil ? true : false
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    return (@passed_checks / @total_checks.to_f) * 100
  end
end
