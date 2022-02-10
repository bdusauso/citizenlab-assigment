defmodule Citizenlab.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Citizenlab.Projects.{Folder, Topic}

  schema "projects" do
    field :description, :string
    field :started, :date
    field :title, :string

    many_to_many :topics, Topic, join_through: "projects_topics"
    belongs_to :folder, Folder
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :started])
    |> validate_required([:title, :description, :started])
  end
end
