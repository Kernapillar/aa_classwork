require 'byebug'

list = [0, 3, 5, 4, -5, 10, 1, 90]

# linear complexity  
def my_min(list)
    min = list[0]
    list.each do |num|
        min = num if num < min
    end
    min
end


# quadratic complexity
# def largest_contiguous_subsum(list)
#     subarr = []
#     i = 0
#     while i < list.length
#         j = 0
#         while j < list.length
#             subarr << list[i..j] if i < j
#            j += 1 
#         end
#         i += 1
#     end
#     largest = subarr[0].sum
#     subarr.each do |arr|
#         largest = arr.sum if arr.sum > largest
#     end
#     largest
# end

#linear complexity
def largest_contiguous_subsum(list)
    largest = list[0]
    curr = list[0]
    if list.all? {|el| el < 0}
        list[0..-1].each do |el|
            if el > largest
                largest = el
            end
        end
    else
        list[1..-1].each do |num| #-7
            # debugger
            if num > 0
                curr += num #curr = 8
            elsif curr + num <= 0
                largest = curr
                # i = list.index(num)
                curr = 0
            else
                curr += num
            end
            largest = curr if curr > largest
        end
    end
    largest
end

