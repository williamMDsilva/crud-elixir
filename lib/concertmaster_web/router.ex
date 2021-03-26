defmodule ConcertmasterWeb.Router do
  use ConcertmasterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug ConcertmasterWeb.Context
   end

  scope "/users" do
    pipe_through :api
    pipe_through :graphql

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ConcertmasterWeb.Schema,
      interface: :playground
      #context: %{pubsub: ConcertmasterWeb.Endpoint}
  end


end
