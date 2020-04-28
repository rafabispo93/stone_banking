defmodule BankingWeb.UserController do
    use BankingWeb, :controller
    require Protocol
    alias Jason.{EncodeError, Encoder}

    def index(conn, _params) do
        users = Banking.Repo.all(Banking.Auth.User)
        json conn, users
    end

    def show(conn, %{"id" => id}) do
        user = Banking.Repo.get(Banking.Auth.User, String.to_integer(id))
        json conn, user
    end

    def create(conn, params) do
        changeset = Banking.Auth.User.changeset(
          %Banking.Auth.User{}, params)
        case Banking.Repo.insert(changeset) do
          {:ok, user} ->
            json conn |> put_status(:created), Jason.encode!(user)
          {:error, _changeset} ->
            json conn |> put_status(:bad_request), %{errors: ["unable to create user"] }
        end
    end
end