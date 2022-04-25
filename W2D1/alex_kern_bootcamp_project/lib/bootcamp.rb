class Bootcamp
    
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h, k|h[k] = []}
    end

    def name
        @name
    end
    
    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher_name)
        @teachers << teacher_name
    end

    def enroll(student_name)
        if @students.length < @student_capacity
            @students << student_name
            return true
        else
            return false
        end
    end


end

