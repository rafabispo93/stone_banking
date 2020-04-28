defmodule BankingWeb.AccountController do
    use BankingWeb, :controller
    require Protocol
    alias Jason.{EncodeError, Encoder}

    def index(conn, _params) do
        accounts = Banking.Repo.all(Banking.Banking.Account)
        json conn, accounts
    end

    def show(conn, %{"id" => id}) do
        account = Banking.Repo.get(Banking.Banking.Account, String.to_integer(id))
        json conn, account
    end

    def create(conn, params) do
        changeset = Banking.Banking.Account.changeset(
          %Banking.Banking.Account{}, params)
        case Banking.Repo.insert(changeset) do
          {:ok, account} ->
            json conn |> put_status(:created), Jason.encode!(account)
          {:error, err} ->
            json conn |> put_status(:bad_request), %{errors: ["unable to create account", err] }
        end
    end
end