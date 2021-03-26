# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :concertmaster,
  ecto_repos: [Concertmaster.Repo]

# Configures the endpoint
config :concertmaster, ConcertmasterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e0I9ajL7tLYtc2r4WV+w3kRj5wxKM77tiiZ3GfOLZrmtEm3/FRhIc8Ld5ji1hsL8",
  render_errors: [view: ConcertmasterWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Concertmaster.PubSub,
  live_view: [signing_salt: "gPYuo1aH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# configures Guardian
config :concertmaster, Concertmaster.Guardian,
  # optional
  allowed_algos: ["HS512"],
  # optional
  verify_module: Guardian.JWT,
  issuer: "Concertmaster",
  ttl: {30, :days},
  allowed_drift: 2000,
  # optional
  verify_issuer: true,
  # generated using: JOSE.JWK.generate_key({:oct, 16}) |> JOSE.JWK.to_map |> elem(1)
  secret_key: %{"k" => "3gx0vXjUD2BJ8xfo_aQWIA", "kty" => "oct"},
  serializer: Concertmaster.Guardian
