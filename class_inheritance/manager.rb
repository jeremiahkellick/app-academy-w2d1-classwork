require_relative "employee"

class Manager < Employee
  def initialize(name, title, salary, boss)
    @subordinates = []
    super
  end

  def add_subordinate(employee)
    @subordinates << employee
  end

  def bonus(multiplier)
    total = 0
    @subordinates.each do |subordinate|
      total += subordinate.bonus(1)
      total += subordinate.salary if subordinate.is_a?(Manager)
    end
    total * multiplier
  end
end
