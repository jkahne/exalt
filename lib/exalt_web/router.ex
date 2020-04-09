defmodule ExaltWeb.Router do
  use ExaltWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExaltWeb do
    pipe_through :browser
    
    get "/home", HomeController, :show
    resources "/notes", NoteController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExaltWeb do
  #   pipe_through :api
  # end
end
