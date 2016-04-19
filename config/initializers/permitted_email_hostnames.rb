hostnames = ENV["PERMITTED_EMAIL_HOSTNAMES"]

if hostnames.present?
  GapOMatic.permitted_email_hostnames = hostnames.split(",")
else
  GapOMatic.permitted_email_hostnames = []
end
