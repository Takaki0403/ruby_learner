# regular_expression

str = 'hello, my name is takaki.'
puts 'str: ' + str

match = str.match(/\w+\s\w+\sis/)
puts 'match: ' + match[0]
puts 'pre_match: ' + match.pre_match
puts 'post_match: ' + match.post_match

# * 0以上, + 1以上, ? 0か1のどちらか
