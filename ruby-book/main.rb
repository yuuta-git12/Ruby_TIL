require_relative './lib/regular_expressions'

# tel_number()

# write_form()

# html_option()

# delete_tab_space()

text = <<-TEXT
    {
        japan:	'yen',
        america:'dollar',
        italy:     'euro'
    }
    TEXT

puts text.gsub(/:[ \t]+/,':')
puts text.gsub(/:\s*/,'    ')
