
class Atbash
  # Hash[('a'..'z').to_a.zip ('a'..'z').to_a.reverse]
  CIPHER = {"a"=>"z", "b"=>"y", "c"=>"x", "d"=>"w", "e"=>"v", "f"=>"u", "g"=>"t", "h"=>"s", "i"=>"r", "j"=>"q", "k"=>"p", "l"=>"o", "m"=>"n", "n"=>"m", "o"=>"l", "p"=>"k", "q"=>"j", "r"=>"i", "s"=>"h", "t"=>"g", "u"=>"f", "v"=>"e", "w"=>"d", "x"=>"c", "y"=>"b", "z"=>"a"}

  def self.encode(str)
    str.downcase!
    cipher_text = str.chars.map { |c| c.match(/\d/) ? c : CIPHER[c] }.join
    cipher_text.scan(/\w{1,5}/).join(" ")
  end
end
