class OrderSimulatorJob < ActiveJob::Base
  DELAY_IN_SECONDS = 5
  PID_FILENAME_PATTERN = Rails.root.join("tmp/pids/order_simulator_job")

  queue_as :default

  def perform(*args)
    OrderSimulator.create!

    OrderSimulatorJob.set(wait: DELAY_IN_SECONDS.seconds).perform_later
  end
end
