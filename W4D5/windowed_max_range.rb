def windowed_max_range(array, window_size)
    current_max_range = nil
    i = 0
    j = i + window_size - 1
    while j < array.length
        window = array[i..j]
        range = window.max - window.min
        if current_max_range == nil
            current_max_range = range
        else
            if current_max_range < range
                current_max_range = range
            end
        end
        i += 1
        j += 1
    end
    current_max_range
end