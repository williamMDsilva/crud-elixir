defmodule ConcertmasterWeb.Schema do
  use Absinthe.Schema

  alias ConcertmasterWeb.UserResolver

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :whatsapp, non_null(:string)
    field :role, non_null(:string)
  end

  input_object :user_params do
    field(:name, :string)
    field(:email, :string)
    field(:whatsapp, :string)
    field(:role, :string)
  end

  query do
    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UserResolver.all_users/3)
    end

    @desc "Get user"
    field :get_user, :user do
      arg :id, non_null(:id)
      resolve &UserResolver.get_user/3
    end
  end

  mutation do
    @desc "Create a new users"
    field :create_user, :user do
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :whatsapp, non_null(:string)
      arg :role, non_null(:string)

      resolve &UserResolver.create_user/3
    end

    @desc "Update a users"
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :user, :user_params

      resolve &UserResolver.update_user/3
    end

    @desc "Delete a users"
    field :delete_user, :user do
      arg :id, non_null(:id)
      resolve &UserResolver.delete_user/3
    end

  end

end
