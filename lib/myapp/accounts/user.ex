defmodule Myapp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  @phone ~r/^[0-9]*$/
  @email ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone_number])
    |> validate_required([:name, :email, :phone_number])
    |> validate_format(:name, ~r/^[a-zA-Z0-9_]*$/,
      message: "only letters, numbers, and underscores please"
    )
    |> validate_length(:name, max: 12)
    |> validate_format(:email, @email, message: "must be a valid email address")
    |> validate_format(:phone_number, @phone, message: "must be a valid number")
    |> validate_length(:phone_number, is: 10)
    |> unique_constraint(:email)
    # |> unique_constraint(:email, name: :veil_users_email_username_index, message: "Duplicate Email")
  end
end
