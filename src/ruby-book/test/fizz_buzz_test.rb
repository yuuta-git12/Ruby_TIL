require 'minitest/autorun'
require_relative '../lib/fizz_buzz' # このファイルのファイルパスを起点として、読み込むファイルを指定する。
# require './lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
     def test_fizz_buzz
          assert_equal '1',fizz_buzz(テスト),msg='失敗です'
          assert_equal '2',fizz_buzz(2)
          assert_equal 'Fizz',fizz_buzz(3)
          assert_equal '4',fizz_buzz(4)
          assert_equal 'Buzz',fizz_buzz(5)
          assert_equal 'Fizz',fizz_buzz(6)
          assert_equal 'Fizz Buzz',fizz_buzz(15)
     end

     def test_fizz_buzz2
          # assert_equal '1',fizz_buzz(10),msg='失敗です'
          assert_equal '2',fizz_buzz(2)
          assert_equal 'Fizz',fizz_buzz(3)
          assert_equal '4',fizz_buzz(4)
          assert_equal 'Buzz',fizz_buzz(5)
          assert_equal 'Fizz',fizz_buzz(6)
          assert_equal 'Fizz Buzz',fizz_buzz(15)
     end
end
