require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertTest < Minitest::Test
    def test_convert_length
        assert_equal 1.00,convert_length(3.28,from: :ft,to: :m)
        assert_equal 3.28,convert_length(1,from: :m,to: :ft)
        assert_equal 0.01,convert_length(1,from: :cm,to: :m)
        assert_equal 0.38,convert_length(15,from: :in,to: :m)
        assert_equal 10670.73,convert_length(35000, from: :ft, to: :m)
    end
end