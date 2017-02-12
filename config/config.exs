# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "toNCHyjvcc8q28SPFEPqy/ZkFrjjgXKzB1/Gm+I2P+CJmcB7AiLpxQleYl3nD06Y",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("84d53f4e975b9070308a"),
  client_secret: System.get_env("2db5777d91d1fd6a0dfa1a71a1b2d1c6675293da")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
