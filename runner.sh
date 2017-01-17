echo "$HALO_API_KEY|$HALO_API_SECRET" > /etc/halo-api-keys

ruby /app/one-of-these-things.rb --report_dir=/reports
