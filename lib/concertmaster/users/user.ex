defmodule Concertmaster.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :role, :string
    field :whatsapp, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :role, :whatsapp])
    |> validate_required([:name, :email, :role, :whatsapp])
  end
end
