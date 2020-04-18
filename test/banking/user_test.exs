defmodule Banking.UserTest do
    use Banking.DataCase
    describe "users" do
        alias Banking.Auth.User
        
        @valid_attrs %{
            email: "email@email.com",
            is_active: true,
            password: "password",
            cpf: "12345678901",
            name: "Name",
            surname: "Surname",
            user_id: "0293d6da-76a3-49ce-b03f-12a8594be892"
        }
        @update_attrs %{
            email: "updatedemail@email.com",
            is_active: false,
            password: "updatedpassword",
            cpf: "12345678901",
            name: "UpdatedName",
            surname: "UpdatedSurname",
            user_id: "0293d6da-76a3-49ce-b03f-12a8594be892"
        }
        @invalid_attrs %{
            email: nil,
            is_active: nil,
            password: nil,
            cpf: nil,
            name: nil,
            surname: nil,
            user_id: nil
        }

        # test "create_user/1 with valid data creates a user" do
        #     assert {:ok, %User{} = user} = Auth.create_user(@valid_attrs)
        #     assert user.email == "email@email.com"
        #     assert user.name == "Name"
        #     assert user.surname == "Surname"
        #     assert user.user_id == "0293d6da-76a3-49ce-b03f-12a8594be892"
        #     assert user.cpf == "12345678901"
        #     assert user.password == "password"
        #     assert user.is_active == true
        # end

        # test "create_user/1 with invalid data returns error changeset" do
        #     assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
        # end
    end
  end