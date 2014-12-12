require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new

# #schedules to run at 8 am local time
# scheduler.cron '0 30 02 * * *' do
#   Rails.logger.info "Setting daily_scheduled_jobs at #{Time.now}"
#   Rails.logger.info "Escalation mail : Send Escalation mail job started"
#   EscalationReport.send_escalation_mail
#   Rails.logger.info "Escalation mail : Send Escalation mail job"
# end

# #schedules to run at 7 pm local time
# scheduler.cron '0 30 13 * * *' do
#   Rails.logger.info "Setting daily_scheduled_jobs at #{Time.now}"
#   Rails.logger.info "Escalation mail : Send Escalation mail job started"
#   EscalationReport.send_escalation_mail
#   Rails.logger.info "Escalation mail : Send Escalation mail job"
# end

# #schedules to run every 30 seconds
# scheduler.cron '30 * * * * *' do
#   Rails.logger.info "Setting daily_scheduled_jobs at #{Time.now}"
#   Rails.logger.info "Rufus test "
# end
