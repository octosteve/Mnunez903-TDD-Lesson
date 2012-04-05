require 'test/unit'
require 'person'
require 'store'
require 'item'

class TestPerson < Test::Unit::TestCase

  def setup
    @person = Person.new
  end

  def test_person_can_have_a_first_name
    @person.first_name = "Eric"

    assert_equal "Eric", @person.first_name
  end

  def test_user_gets_discount_if_over_65
    @person.age = 18

    assert_equal false, @person.discount?, "Should not have discount"
    @person.age = 66

    assert_equal true,  @person.discount?, "Should have discount"
  end

  def test_user_gets_discount_if_student
    @person.student = true

    assert_equal true, @person.discount?

    @person.student = false

    assert_equal false, @person.discount?
  end

  def test_should_apply_discount
    assert_equal 0.25, Store::DISCOUNT
    @person.student = true
    item = Item.new price: 10.00
    @person.add_to_cart item

    assert_equal 7.50, @person.total
  end
end
