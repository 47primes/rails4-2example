require 'test_helper'

describe "OrderSimulatorJob.perform" do
  it "should create a fake order" do
    order_count = Order.count(:id)
    OrderSimulatorJob.perform_now

    Order.count(:id).must_equal order_count + 1
  end

  it "should queue another job with a delay" do
    job_count = Delayed::Job.count(:id)
    OrderSimulatorJob.perform_now

    Delayed::Job.count(:id).must_equal job_count + 2

    publisher_job, simulator_job = Delayed::Job.last(2)

    publisher_job_handler = YAML.load publisher_job.handler
    simulator_job_handler = YAML.load simulator_job.handler

    publisher_job_handler.job_data["job_class"].must_equal "OrderPublisherJob"

    simulator_job_handler.job_data["job_class"].must_equal "OrderSimulatorJob"
  end
end
