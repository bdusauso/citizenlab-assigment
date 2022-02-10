defmodule Citizenlab.Projects.Folder do
  use Ecto.Schema
  import Ecto.Changeset
  alias Citizenlab.Projects.Folder

  schema "folders" do
    field :description, :string
    field :started, :date
    field :title, :string

    belongs_to :parent, Folder, foreign_key: :parent_id

    timestamps()
  end

  @doc false
  def changeset(folder, attrs) do
    folder
    |> cast(attrs, [:title, :description, :started])
    |> validate_required([:title, :description, :started])
  end
end
