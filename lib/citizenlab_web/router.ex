defmodule CitizenlabWeb.Router do
  use CitizenlabWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CitizenlabWeb do
    pipe_through :api

    get "/items", ItemController, :index
  end
end
