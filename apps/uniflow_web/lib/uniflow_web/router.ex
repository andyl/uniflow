defmodule UniflowWeb.Router do
  use UniflowWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
    plug UniflowWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UniflowWeb do
    pipe_through :browser

    get "/",     HomeController, :index
    get "/urls", HomeController, :urls
    get "/logs", HomeController, :logs
    get "/data", HomeController, :data

    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    live "/demo", Demo
  end

  scope "/api", UniflowWeb do
    pipe_through :api
  end
end
