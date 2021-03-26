defmodule ConcertmasterWeb.AuthHelper do
  @moduledoc false

  import Comeonin.Bcrypt, only: [checkpw: 2]
  alias Concertmaster.Repo
  alias Concertmaster.Users.User

  @spec login_with_email_pass(binary, any) ::
          {:error, :"User not found" | <<_::216>>}
          | {:ok, atom | %{:password_hash => binary, optional(any) => any}}
  def login_with_email_pass(email, given_pass) do
    user = Repo.get_by(User, email: String.downcase(email))

    cond do
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, "Incorrect login credentials"}

      true ->
        {:error, :"User not found"}
    end
  end
end
