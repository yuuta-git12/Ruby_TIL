# 引数が3の倍数の場合Fizz、5の倍数の場合Buzz、15の倍数の場合FizzBuzzを
# 返すプログラム
# ===引数
# * +n+ - 整数
# ===戻り値
# * nの値が引数が3の倍数の場合Fizz、5の倍数の場合Buzz、15の倍数の場合FizzBuzzを返す
def fizz_buzz(n)
    if n % 15 == 0
        'Fizz Buzz'
    elsif n % 3 == 0
        'Fizz'
   elsif n % 5 == 0
        'Buzz'
   else
        n.to_s
   end
end
