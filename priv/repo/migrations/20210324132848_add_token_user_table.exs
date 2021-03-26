defmodule Concertmaster.Repo.Migrations.AddTokenUserTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :token, :text
     end
  end
end
