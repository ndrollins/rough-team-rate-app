defmodule TeamRate.Repo do
  use Ecto.Repo,
    otp_app: :team_rate,
    adapter: Ecto.Adapters.Postgres
end
