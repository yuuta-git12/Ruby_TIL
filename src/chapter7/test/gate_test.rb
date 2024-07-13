require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test

  # テストメソッドが実行される前にsetupメソッドが毎回呼ばれる
  # オブジェクトを共通化する場合はsetupに書くことで、
  # 各メソッドでオブジェクトを作成する必要がない
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_umeda_to_juso

    # 1.Gateオブジェクトが作成される確認
    # assert Gate.new

    # 2.テストシナリオ1 期待値 True

    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    assert @juso.exit(ticket)
  end

  # 3.テストシナリオ2 期待値False
  def test_umeda_to_mikuni_when_fare_is_not_enough

    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    refute @mikuni.exit(ticket)
  end

  # 4.テストシナリオ3 期待値True
  def test_umetda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  # 5.テストシナリオ4 期待値True
  def test_juso_to_mikuni
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
