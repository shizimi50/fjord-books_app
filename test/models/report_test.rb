# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:report)
  end

  test '#editable?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end

  test '#created_on' do
    assert_not_equal DateTime.tomorrow.to_date, @report.created_on
    assert_equal DateTime.now.to_date, @report.created_on
  end
end
