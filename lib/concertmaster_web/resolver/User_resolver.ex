defmodule ConcertmasterWeb.UserResolver do
  alias Concertmaster.Users

  def all_users(_root, _args, _info) do
    {:ok, Users.list_users()}
  end

  def get_user(_root, %{id: id}, _info) do
    {:ok, Users.get_user!(id)}
  end

  def create_user(_root, args, _info) do
    case Users.create_user(args) do
      {:ok, link} ->
        {:ok, link}

      _error ->
        {:error, "could not create user"}
    end
  end

  def update_user(_root, %{id: id, user: user_params}, _info) do
    Users.get_user!(id)
    |> Users.update_user(user_params)
  end

  def delete_user(_root, %{id: id}, _info) do
    user = Users.get_user!(id)
    Users.delete_user(user)
  end
end
