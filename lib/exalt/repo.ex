defmodule Exalt.Repo do
  use Ecto.Repo,
    otp_app: :exalt,
    adapter: Ecto.Adapters.Postgres
end
