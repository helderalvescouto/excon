defmodule Excon.Repo do
  use Ecto.Repo,
    otp_app: :excon,
    adapter: Ecto.Adapters.Postgres
end
