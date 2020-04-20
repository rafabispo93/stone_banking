defmodule BankingWeb.UserController do
    use BankingWeb, :controller

    def index(conn, _params) do
        users = Banking.Repo.all(Banking.Auth.User)
        json conn, users
    end

    def show(conn, %{"id" => id}) do
        user = Banking.Repo.get(Banking.Auth.User, String.to_integer(id))
        json conn, user
    end
end