module ApplicationHelper
  def logged_in?
    session[:kinde_auth].present? && !KindeSdk.token_expired?(session[:kinde_auth])
  end

  def mgmt_token_alive?
    $redis.get("kinde_m2m_token").present?
  end

  def print_organization(org)
    str = "#{org.name} (#{org.code})"
    str = "#{str} DEFAULT" if org.is_default
    str
  end

  def print_user(user)
    "#{user.email.presence || "---"} (#{user.first_name} #{user.last_name})"
  end

  def kinde_account_full_name
    [session[:kinde_user]["first_name"], session[:kinde_user]["last_name"]].join(" ")
  end
end
