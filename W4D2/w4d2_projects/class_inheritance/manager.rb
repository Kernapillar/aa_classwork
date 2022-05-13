require_relative "employee"
class Manager < Employee
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        total = 0
        employees.each do |emp| 
            total += emp.salary
        end
        bonus = total * multiplier
    end


    attr_reader :employees
end