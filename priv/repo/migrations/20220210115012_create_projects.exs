defmodule Citizenlab.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :text
      add :started, :date

      timestamps()
    end
  end
end
