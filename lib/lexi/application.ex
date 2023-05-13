defmodule Lexi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LexiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lexi.PubSub},
      # Start Finch
      {Finch, name: Lexi.Finch},
      # Start the Endpoint (http/https)
      LexiWeb.Endpoint
      # Start a worker by calling: Lexi.Worker.start_link(arg)
      # {Lexi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lexi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LexiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
