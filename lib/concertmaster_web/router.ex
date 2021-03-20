defmodule ConcertmasterWeb.Router do
  use ConcertmasterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/users" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ConcertmasterWeb.Schema,
      interface: :simple,
      context: %{pubsub: ConcertmasterWeb.Endpoint}
  end

end
