defmodule Banking.Banking.UserAccount do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user_accounts" do
    field :account_id, :binary_id
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(user_account, attrs) do
    user_account
    |> cast(attrs, [])
    |> validate_required([])
  end
end
