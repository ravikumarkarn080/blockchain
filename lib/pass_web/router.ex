defmodule PassWeb.Router do
  use PassWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PassWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/server" , ServerController , :index
    resources "/pdas", PDAController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PassWeb do
  #   pipe_through :api
  # end
end
