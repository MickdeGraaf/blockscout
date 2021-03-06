use Mix.Config

config :indexer, Indexer.Tracer, env: "dev", disabled?: true

config :logger, :indexer,
  level: :debug,
  path: Path.absname("logs/dev/indexer.log")

config :logger, :indexer_token_balances,
  level: :debug,
  path: Path.absname("logs/dev/indexer/token_balances/error.log"),
  metadata_filter: [fetcher: :token_balances]

variant = "parity"

# Import variant specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "dev/#{variant}.exs"
