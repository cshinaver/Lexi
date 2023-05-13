defmodule Lexi.Repo do
  use Ecto.Repo,
    otp_app: :lexi,
    adapter:
      if(Mix.env() in [:dev, :test],
        do: Ecto.Adapters.SQLite3,
        else: Ecto.Adapters.Postgres
      )
end
