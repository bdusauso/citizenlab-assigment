defmodule Citizenlab.Repo.Migrations.CreateFolders do
  use Ecto.Migration

  def change do
    create table(:folders) do
      add :title, :string
      add :description, :string
      add :started, :date
      add :parent_id, references("folders")

      timestamps()
    end

    alter table(:projects) do
      add :folder_id, references("folders")
    end
  end
end
