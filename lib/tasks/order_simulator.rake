namespace :order_simulator do
  desc "Start order simulation"
  task start: :environment do
    system("#{Rails.root.join("bin/delayed_job")} start")
    Rake::Task["order_simulator:enqueue"].execute
  end

  desc "Stop order simulation"
  task stop: :environment do
    system("#{Rails.root.join("bin/delayed_job")} stop")
    Rake::Task["jobs:clear"].execute
  end

  task enqueue: :start do
    OrderSimulatorJob.perform_later
  end
end