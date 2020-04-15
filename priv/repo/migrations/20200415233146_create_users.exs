defmodule Banking.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, :uuid
      add :name, :string
      add :surname, :string
      add :cpf, :string
      add :email, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
