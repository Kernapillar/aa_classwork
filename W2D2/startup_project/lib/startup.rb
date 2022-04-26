require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    attr_reader :name, :funding, :salaries, :employees

    def valid_title?(title)
        return true if @salaries.include?(title)
        false
    end

    def >(other)
        if self.funding > other.funding
            return true
        else
            false
        end
    end

    def hire(emp_name, emp_title)
        if valid_title?(emp_title)
            new_emp = Employee.new(emp_name, emp_title)
            @employees << new_emp
        else
            raise ArgumentError.new "Incorrect title for #{emp_name}"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        if @funding > @salaries[emp.title]
            emp.pay(@salaries[emp.title])
            @funding -= @salaries[emp.title]
        else
            raise ValueError.new "Not enough funding to pay employee"
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp)}
    end

    def average_salary
        total = 0
        @employees.each do |emp|
            total += @salaries[emp.title]
        end
        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other)
        @funding += other.funding
        other.salaries.each do |title, pay|
            unless @salaries.include?(title)
                @salaries[title] = pay
            end
        end
        @employees += other.employees
        other.close
    end
end
