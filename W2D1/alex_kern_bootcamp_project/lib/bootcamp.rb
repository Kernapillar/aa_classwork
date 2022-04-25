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

    def enrolled?(student_name)
        @students.include?(student_name)
    end

    def student_to_teacher_ratio
        ratio = students.length / teachers.length
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if enrolled?(student) && @grades[student].length >0
            total = @grades[student].sum
            return total / @grades[student].length
        end
        nil
    end
end

