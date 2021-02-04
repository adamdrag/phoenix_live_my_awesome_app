defmodule MyAwesomeApp.Accounts.UserNotifier do
  alias MyAwesomeApp.Emails

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    deliver(user.email, """

    ==============================

    Hi #{user.email},

    You can confirm your account by visiting the URL below:

    #{url}

    If you didn't create an account with us, please ignore this.

    ==============================
    """)

    Emails.send_email_user_created_instructions(user, url)
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    deliver(user.email, """

    ==============================

    Hi #{user.email},

    You can reset your password by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)

    Emails.send_email_reset_password_instructions(user, url)
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    deliver(user.email, """

    ==============================

    Hi #{user.email},

    You can change your email by visiting the URL below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)

    Emails.send_email_update_instructions(user, url)
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_passoword_notification(user) do
    deliver(user.email, """

    ==============================

    Hi #{user.email},

    You updated your password successfully.

    If you didn't make this change, please contact us.

    ==============================
    """)

    Emails.send_password_update(user)
  end

  defp deliver(to, body) do
    require Logger
    Logger.debug(body)
    {:ok, %{to: to, body: body}}
  end
end
