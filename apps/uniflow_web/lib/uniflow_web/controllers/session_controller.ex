defmodule UniflowWeb.SessionController do
  alias Mim.Api.Account
  use UniflowWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "pwd" => pwd}}) do
    case Account.user_authenticate(email, pwd) do
      nil ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")

      user ->
        conn
        |> UniflowWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.home_path(conn, :index))
    end
  end

  def delete(conn, _) do
    conn
    |> UniflowWeb.Auth.logout()
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
