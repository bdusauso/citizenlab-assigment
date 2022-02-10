defmodule Mix.Tasks.Citizenlab.ImportSeeds do
  use Mix.Task
  import Ecto.Changeset
  alias Citizenlab.Projects.Project
  alias Citizenlab.Repo

  @shortdoc "Import seeds from 'sample_data.json'"

  def run(_args) do
    # init()

    json =
      "sample_data.json"
      |> File.read!()
      |> Jason.decode!()

    import_topics(json)
    import_folders(json)
    import_projects(json)
    end

  # defp init(), do: Mix.Ecto.ensure_started(Citizenlab.Repo, [])

  # defp import_
  defp import_projects(json) do
    json
    |> Map.fetch!("projects")
    |> Enum.map(&import_project/1)
  end

  defp import_project(project_attrs) do
    project_title = project_attrs["title"]
    Mix.shell().info("Importing project #{project_title}")

    project_attrs
    |> import_project_changeset()
    |> Repo.insert!()
  end

  defp import_project_changeset(attrs) do
    %Project{}
    |> cast(attrs, [:id, :title, :description, :started])
    |> validate_required([:id, :title, :description, :started])
  end

  defp import_topics(json) do
    json
    |> Map.fetch!("topics")
    |> Enum.map(&import_topic/1)
  end

  defp import_topic(topic_attrs) do
    topic_title = topic_attrs["title"]
    Mix.shell().info("Importing topic #{topic_title}")
  end

  def import_folders(json) do
    json
    |> Map.fetch!("folders")
    |> Enum.sort_by(&(&1.id))
    |> Enum.map(&import_folder/1)
  end

  defp import_folder(folder_attrs) do
    folder_title = folder_attrs["title"]
    Mix.shell().info("Importing folder #{folder_title}")
  end
end
