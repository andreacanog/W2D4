class String

    def select (&prc)
        new_str = ""

        return "" if prc.nil?
        self.each_char do |char|
            if prc.call(char)
                new_str += char
            end
        end

        new_str
    end

    def map!(&prc)

        (0...self.length).each do |i|
            ele = prc.call(self[i])
            self[i] = ele
        end

        self 
    end


end

    # Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""


# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

