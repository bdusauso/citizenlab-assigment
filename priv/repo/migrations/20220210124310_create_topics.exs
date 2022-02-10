defmodule Citizenlab.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
    end

    create table(:projects_topics, primary_key: false) do
      add :project_id, references("projects")
      add :topic_id, references("topics")
    end

    create unique_index("projects_topics", [:project_id, :topic_id])
  end
end
