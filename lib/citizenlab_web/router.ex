defmodule CitizenlabWeb.Router do
  use CitizenlabWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CitizenlabWeb do
    pipe_through :api
  end
end
