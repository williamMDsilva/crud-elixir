defmodule ConcertmasterWeb.UserResolver do
  alias Concertmaster.Users

  def all_users(_root, _args, _info) do
    {:ok, Users.list_users()}
  end

  def get_user(_root, %{id: id}, %{context: %{current_user: _current_user}}) do
    {:ok, Users.get_user!(id)}
  end

  def get_user(_root, _args, _info) do
    {:error, "Not Authorized"}
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

  def login(%{email: email, password: password}, _info) do
    with {:ok, user} <- ConcertmasterWeb.AuthHelper.login_with_email_pass(email, password),
         {:ok, jwt, _} <- Concertmaster.Guardian.encode_and_sign(user),
         {:ok, _ } <- Concertmaster.Users.store_token(user, jwt) do
      {:ok, %{token: jwt, user: user}}
    end
  end

  def logout(_root, _args,  %{context: %{current_user: current_user, token: _token}}) do
    Users.revoke_token(current_user, nil)
    {:ok, current_user}
  end

  def logout(_root, _args, _info) do
    {:error, "Please log in first!"}
  end

end
