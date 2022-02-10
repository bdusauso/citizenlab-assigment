defmodule Citizenlab.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Citizenlab.Repo,
      # Start the Telemetry supervisor
      CitizenlabWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Citizenlab.PubSub},
      # Start the Endpoint (http/https)
      CitizenlabWeb.Endpoint
      # Start a worker by calling: Citizenlab.Worker.start_link(arg)
      # {Citizenlab.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Citizenlab.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CitizenlabWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
