defmodule Conference.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), opts())
  end

  defp children do
    [
      {
        Plug.Adapters.Cowboy,
        scheme: :http,
        plug: User.Plug.Router,
        options: [
          port: 4000
        ]
      },
      Conference.Repository.UserDetailsRepo
    ]
  end

    defp opts do
      [
        strategy: :one_for_one,
        name: Conference.Supervisor
      ]
    end
end