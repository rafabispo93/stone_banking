defmodule Banking.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :account_id, :uuid
      add :number, :integer
      add :agency, :string
      add :type, :string
      add :balance, :decimal
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
