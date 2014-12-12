Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.logger = Logger.new("#{Rails.root.to_s}/log/delayed_job.log", 'daily')
Delayed::Worker.max_attempts = 1