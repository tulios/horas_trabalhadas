require 'test_helper'

class TimeLogTest < ActiveSupport::TestCase
 test "required" do
   assert_required_values(TimeLog, :task_date => Date.today,
                                   :worked_hours => Time.now)
 end
end
