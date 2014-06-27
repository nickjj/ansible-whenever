set_cron_for = Time.now + 60
whenever_at = set_cron_for.strftime('%l:%M %P')

every 1.day, at: whenever_at do
  command "echo 'whenever is awesome' > /tmp/whenever"
end