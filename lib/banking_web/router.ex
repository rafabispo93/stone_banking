defmodule BankingWeb.Router do
  use BankingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankingWeb do
    pipe_through :api

    get "/users", UserController, :index
    get "/user/:id", UserController, :show
    post "/user/add", UserController, :create

    get "/accounts", AccountController, :index
    get "/account/:id", AccountController, :show
    post "/account/add", AccountController, :create

    get "/transactions", TransactionController, :index
    get "/transaction/:id", TransactionController, :show
    post "/transaction", TransactionController, :create
   
  end
end