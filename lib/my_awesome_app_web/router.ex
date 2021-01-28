defmodule MyAwesomeAppWeb.Router do
  use MyAwesomeAppWeb, :router

  import MyAwesomeAppWeb.Accounts.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MyAwesomeAppWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyAwesomeAppWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyAwesomeAppWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: MyAwesomeAppWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", MyAwesomeAppWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated, :put_session_layout]

    get "/users/register", Accounts.UserRegistrationController, :new
    post "/users/register", Accounts.UserRegistrationController, :create
    get "/users/log_in", Accounts.UserSessionController, :new
    post "/users/log_in", Accounts.UserSessionController, :create
    get "/users/reset_password", Accounts.UserResetPasswordController, :new
    post "/users/reset_password", Accounts.UserResetPasswordController, :create
    get "/users/reset_password/:token", Accounts.UserResetPasswordController, :edit
    put "/users/reset_password/:token", Accounts.UserResetPasswordController, :update
  end

  scope "/", MyAwesomeAppWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", Accounts.UserSettingsController, :edit
    put "/users/settings", Accounts.UserSettingsController, :update
    get "/users/settings/confirm_email/:token", Accounts.UserSettingsController, :confirm_email
    put "/users/settings/update_avatar", Accounts.UserSettingsController, :update_avatar
  end

  scope "/", MyAwesomeAppWeb do
    pipe_through [:browser]

    delete "/users/log_out", Accounts.UserSessionController, :delete
    get "/users/confirm", Accounts.UserConfirmationController, :new
    post "/users/confirm", Accounts.UserConfirmationController, :create
    get "/users/confirm/:token", Accounts.UserConfirmationController, :confirm
    live "/calendar", Pages.CalendarLive.Index, :index
    live "/dropdown-alpine", Pages.DropdownAlpineLive.Index, :index
    live "/table", Pages.TableLive.Index, :index
  end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end
end
