def testfun(num, prc)
    prc.call(num)
end


abcdefg = Proc.new do |ele|
    ele * 2
end

my_proc_2 = Proc.new {|ele| ele * 14}

p testfun(8, abcdefg)
p testfun(10, my_proc_2)