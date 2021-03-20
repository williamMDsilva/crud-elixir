defmodule Concertmaster.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :text
      add :role, :text
      add :whatsapp, :text

      timestamps()
    end

  end
end
