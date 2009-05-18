require 'test_helper'

class SummaryReportTest < ActiveSupport::TestCase

  test "gerar relatorio sem parametros" do
    rep = SummaryReport.new
    data = rep.report_data
    assert_equal 2, data.length
  end
 
  test "gerar relatorio com filtro em projeto" do
    rep = SummaryReport.new
    rep.project = projects(:one) #projects é uma variavel criada pelas fixtures.
    data = rep.report_data
    assert_equal 1, data.length
  end

  test "gerar relatorio com filtro em task type" do
    rep = SummaryReport.new
    rep.task_type = TaskType.find(1)
    data = rep.report_data
    assert_equal 1, data.length
  end

end
