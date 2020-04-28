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
    field :user_id, Ecto.UUID, default: Ecto.UUID.generate()
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:id, :user_id, :name, :surname, :cpf, :email, :is_active, :password])
    |> validate_required([:name, :surname, :cpf, :email, :password])
    |> put_password_hash()
  end

  defimpl Jason.Encoder, for: Banking.Auth.User do
    def encode(value, opts) do
      Jason.Encode.map(Map.take(value, [:id, :user_id, :name, :surname, :cpf, :email, :is_active, :password]), opts)
    end
  end

  defp put_password_hash(
        %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
      ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset) do
    changeset
  end
end

