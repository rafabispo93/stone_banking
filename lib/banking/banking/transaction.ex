defmodule Banking.Banking.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :value, :decimal
    field :account_id, :binary_id
    field :user_id, :binary_id
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:id, :value, :type, :user_id, :account_id])
    |> validate_required([:value, :account_id, :type])
  end

  defimpl Jason.Encoder, for: Banking.Banking.Transaction do
    def encode(value, opts) do
      Jason.Encode.map(Map.take(value, [:id, :value, :type, :user_id, :account_id]), opts)
    end
  end
end
