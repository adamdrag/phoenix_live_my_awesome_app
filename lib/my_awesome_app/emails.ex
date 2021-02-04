defmodule MyAwesomeApp.Emails do
  import Bamboo.Email
  use Bamboo.Phoenix, view: MyAwesomeAppWeb.EmailView

  @from "NoReply@myawesomeapp.com"

  def send_email_user_created_instructions(%{email: email}, url) do
    base_email()
    |> subject("Registration email confirmation!")
    |> to(email)
    |> render("instruction.html",
      message: "MyAwesomeApp registration confirmation message",
      text: "to finish registration",
      email: email,
      url: url
    )
    |> send()
  end

  def send_email_reset_password_instructions(%{email: email}, url) do
    base_email()
    |> subject("Reset password request!")
    |> to(email)
    |> render("instruction.html",
      message: "MyAwesomeApp reset password instructions message",
      text: "to open reset password form",
      email: email,
      url: url
    )
    |> send()
  end

  def send_email_update_instructions(%{email: email}, url) do
    base_email()
    |> subject("Email update request!")
    |> to(email)
    |> render("instruction.html",
      message: "MyAwesomeApp email change verification message",
      text: "to update your email",
      email: email,
      url: url
    )
    |> send()
  end

  def send_password_update(%{email: email}) do
    base_email()
    |> subject("Password updated!")
    |> to(email)
    |> render("notification.html",
      message: "MyAwesomeApp password change notification message",
      text: "You updated your password successfully.",
      email: email
    )
    |> send()
  end

  defp base_email() do
    new_email()
    |> from({"My Awesome App Service", @from})
    |> put_html_layout({MyAwesomeAppWeb.LayoutView, "email.html"})
  end

  defp send(email) do
    MyAwesomeAppWeb.Mailer.deliver_now(email)
  end
end
