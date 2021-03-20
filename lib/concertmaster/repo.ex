defmodule Concertmaster.Repo do
  use Ecto.Repo,
    otp_app: :concertmaster,
    adapter: Ecto.Adapters.Postgres
end
