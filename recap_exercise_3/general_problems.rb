
def no_dupes?(arr)
    result = []
    hash = Hash.new(0)

    arr.each { |ele| hash[ele] += 1}
    hash.keys.select { |ele| hash[ele] == 1}
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    repeats = []

    arr.each do |ele|
        if repeats.last == ele
            return false
        else
            repeats << ele
        end
    end
    
    return true
end 


# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index do |char, i|
        hash[char] << i
    end

    hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}



def longest_streak(str)
    current = ""
    longest = ""

    # return str if str.length <= 1
    (0...str.length - 1).each do |i| #longest_streak('accccbbb')    # => 'cccc'
        # current_char = str[i]
        # next_char = str[i + 1]
        if str[i] == str[i + 1] 
            current += str[i] #cc cc
        else
            current = str[i + 1] #c
        end
      

        if current.length >= longest.length
            longest = current
        end
    end

    longest 
end


# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    fact = []

    (2...num).each do |i|
        if num % i == 0
            fact << i
        end
    end
    
    fact.all? { |num| prime?(num)}
end


def prime?(num)
    return false if num < 2

    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end

    return true 
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    cipher = ""
    alphabet = ("a".."z").to_a
    
    message.each_char.with_index do |char, i|
        old_idx = alphabet.index(char)
        key = keys[i % keys.length] 
        new_idx = (old_idx + key) % 26
        new_char = alphabet[new_idx]
        cipher += new_char
    end

    cipher 
end


# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    rotate = str[0..-1]
    vowels = 'aeiou'

    vowels_idxs = (0...str.length).select { |i| vowels.include?(str[i]) }
    rotated_idxs = vowels_idxs.rotate(-1)

    vowels_idxs.each_with_index do |vowel_idx, i|
        new_vowel = str[rotated_idxs[i]]
        rotate[vowel_idx] = new_vowel
    end

    rotate
end




# Examples
vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"
