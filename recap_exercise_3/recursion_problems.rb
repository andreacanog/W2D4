# def multiply(a, b)
#     return a if b == 1

#     if a < 0 && b < 0
#         return multiply(a.abs, b.abs)
#     elsif a < 0 && b > 0 || a > 0 && b < 0
#         return -1 * multiply(a.abs, b.abs)
#     else 
#         a += multiply(a, b - 1)
#     end
# end


def multiply(a, b)
    return 0 if a == 0 || b == 0

    if a > 0
        b + multiply(a - 1, b)
    else
        -b + multiply(a + 1, b)
    end
end

puts multiply(3,5)         # => 15
puts multiply(5, 3)        # => 15
puts multiply(2, 4)        # => 8
puts multiply(0, 10)       # => 0
puts multiply(-3, -6)      # => 18
puts multiply(3, -6)       # => -18
puts multiply(-3, 6)       # => -18


def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    seq = lucas_sequence(n - 1)
    seq << seq[-2] + seq[-1]
        
end


# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    (2...num).each do |fact_1|
        if (num % fact_1 == 0)
            fact_2 = num / fact_1
            return [ *prime_factorization(fact_1), *prime_factorization(fact_2) ]
        end
    end

    [num]
end


# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]