defmodule MyAwesomeApp.Repo do
  use Ecto.Repo,
    otp_app: :my_awesome_app,
    adapter: Ecto.Adapters.Postgres
end
