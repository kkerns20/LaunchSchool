=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=end

def staggered_case(str)
  upcase_ind = true
  output = str.chars.map do |chr|
    if chr =~ /[A-Za-z]/
      if upcase_ind == true 
        upcase_ind = !upcase_ind
        chr.upcase
      else
        upcase_ind = !upcase_ind
        chr.downcase
      end
    else
      chr
    end
  end
  output.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
