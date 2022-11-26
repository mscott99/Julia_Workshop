function bar(l)
    acc = 1
    for j in 1:l
        acc *= l + j
    end
    acc
end

function foo(k)
    i = 0
    for j in 1:k
        i += bar(k-j)
    end
    i
end

@show foo(1000000)