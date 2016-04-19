class User < ActiveRecord::Base
  validates :name, :email, :provider, :provider_uid, presence: true
  validate :email_has_permitted_hostname, on: :create

  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_initialize_by(provider: auth_hash[:provider],
                                 provider_uid: auth_hash[:uid])
    user.assign_attributes(
      name: auth_hash[:info][:name],
      email: auth_hash[:info][:email],
    )

    user.save
    user
  end

private
  def email_has_permitted_hostname
    if email.blank? || GapOMatic.permitted_email_hostnames.empty?
      return
    end

    hostname = email.match(/@([A-Za-z0-9\-\.]+)\Z/) {|matches|
      matches[1]
    }

    unless GapOMatic.permitted_email_hostnames.include?(hostname)
      errors.add(:email, "is not on an allowed domain name")
    end
  end

end
