class GrammarStats
  def initialize
    @total_checks = 0
    @passed_checks = 0
  end

  def check(text)
    @total_checks += 1
    result = /^[A-Z].*[.?!]/ =~ text
    @passed_checks +=1 if result != nil
    result != nil ? true : false
  end

  def percentage_good
    fail "No checks performed yet." if @total_checks == 0
    return (@passed_checks / @total_checks.to_f) * 100
  end
end
