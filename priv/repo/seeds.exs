# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Concertmaster.Repo.insert!(%Concertmaster.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Concertmaster.Users.User
alias Concertmaster.Repo

%User{name: "Admin", email: "adm@teste.com", role: "admin", whatsapp: "+5545998352261" } |> Repo.insert!
%User{name: "Teste", email: "tst@teste.com", role: "user", whatsapp: "+5545998352262"} |> Repo.insert!
