# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :excon,
  ecto_repos: [Excon.Repo]

config :tesla, adapter: Tesla.Adapter.Hackney

# Configures the endpoint
config :excon, ExconWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FBg8Y2/XLDWqVV8z7kDglcsQbk6k6eI2ktzNvmmai3k3WA1B2gtldKjeXJkwonwZ",
  render_errors: [view: ExconWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Excon.PubSub,
  live_view: [signing_salt: "FPz1CwrI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
