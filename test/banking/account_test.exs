defmodule Banking.AccountTest do
    use Banking.DataCase
    describe "accounts" do
        alias Banking.Banking.Account
        
        @valid_attrs %{
            account_id: "1293d6da-76a3-49ce-b03f-12a8594be892",
            agency: "1688",
            balance: 852.41,
            is_active: true,
            number: "159783",
            type: "current"
        }
        @update_attrs %{
            account_id: "1293d6da-76a3-49ce-b03f-12a8594be892",
            agency: "1688",
            balance: 958.71,
            is_active: true,
            number: "159783",
            type: "current"
        }
        @invalid_attrs %{
            account_id: nil,
            is_active: nil,
            number: nil,
            type: nil,
            agency: nil, 
        }
    end
  end