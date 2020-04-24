defmodule Banking.Banking.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :account_id, Ecto.UUID
    field :agency, :string
    field :balance, :decimal
    field :is_active, :boolean, default: false
    field :number, :integer, default: :rand.uniform(999999)
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:account_id, :agency, :type, :number, :balance, :is_active])
    |> validate_required([:account_id, :agency, :type])
  end

  defimpl Jason.Encoder, for: Banking.Banking.Account do
    def encode(value, opts) do
      Jason.Encode.map(Map.take(value, [:account_id, :number, :agency, :type, :balance, :is_active]), opts)
    end
  end
end
