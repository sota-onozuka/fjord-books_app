# frozen_string_literal: true

require 'test_helper'
require 'date'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def editable?(target_user)
    user == target_user
  end

  test "#created_on" do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    report = Report.create!(title: 'testtitle', content: 'testcontent', user_id: me.id)
    assert_equal report.created_on, Date.today
  end

  test "#editable?" do
    me = User.create!(email: 'me@example.com', password: 'password1')
    she = User.create!(email: 'she@example.com', password: 'password2')
    report = Report.create!(title: 'testtitle', content: 'testcontent', user_id: me.id)

    assert report.editable?(me)
    assert_not report.editable?(she)
  end
end
