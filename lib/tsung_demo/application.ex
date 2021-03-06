defmodule TsungDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    http_port = Application.get_env(:tsung_demo, :http_port)

    children = [
      {Plug.Cowboy, scheme: :http, plug: TsungDemo.Router, options: [port: http_port]},
      {TsungDemo.DB, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TsungDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
