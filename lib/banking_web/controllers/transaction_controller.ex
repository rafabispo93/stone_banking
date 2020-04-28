defmodule BankingWeb.TransactionController do
    use BankingWeb, :controller
    require Protocol
    alias Jason.{EncodeError, Encoder}

    def index(conn, _params) do
        transactions = Banking.Repo.all(Banking.Banking.Transaction)
        json conn, transactions
    end

    def show(conn, %{"id" => id}) do
        transaction = Banking.Repo.get(Banking.Banking.Transaction, String.to_integer(id))
        json conn, transaction
    end

    def create(conn, params) do
        changeset = Banking.Banking.Transaction.changeset(
          %Banking.Banking.Transaction{}, params)
        case Banking.Repo.insert(changeset) do
          {:ok, transaction} ->
            if params["type"] == "deposit" do
                account = Banking.Repo.get_by(Banking.Banking.Account, id: params["account_id"])
                new_account = account |> Map.put(:balance, Decimal.add(account.balance, Decimal.cast(params["value"])))
                updated_account = Banking.Banking.Account.changeset(
                    %Banking.Banking.Account{
                        id: params["account_id"]}, Map.from_struct(new_account))
                    |> Banking.Repo.update!()
                IO.inspect(updated_account)
            end
            json conn |> put_status(:created), Jason.encode!(transaction)
          {:error, err} ->
            json conn |> put_status(:bad_request), %{errors: ["unable to do transaction", err] }
        end
    end
end