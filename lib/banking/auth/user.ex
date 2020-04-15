defmodule Banking.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :cpf, :string
    field :email, :string
    field :is_active, :boolean, default: false
    field :name, :string
    field :surname, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :name, :surname, :cpf, :email, :is_active])
    |> validate_required([:user_id, :name, :surname, :cpf, :email, :is_active])
  end
end
