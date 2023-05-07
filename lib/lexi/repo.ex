defmodule Lexi.Repo do
  use Ecto.Repo,
    otp_app: :lexi,
    adapter: Ecto.Adapters.Postgres
end
