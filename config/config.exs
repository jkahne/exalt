# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exalt,
  ecto_repos: [Exalt.Repo]

# Configures the endpoint
config :exalt, ExaltWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5HUP9KuiYKxq1BXaigcNgycSatRZp26Uewtytzqu9UWGylgup36QLgHioP6rlfiO",
  render_errors: [view: ExaltWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Exalt.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "8nVTdSV7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


config :hound, driver: "chrome_driver"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
