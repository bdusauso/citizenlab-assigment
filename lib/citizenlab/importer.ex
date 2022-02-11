defmodule Citizenlab.Importer do
  alias Citizenlab.Projects.{Folder, Project, Topic}
  alias Citizenlab.Repo

  def import do
    json =
      "sample_data.json"
      |> File.read!()
      |> Jason.decode!(keys: :atoms)

    import_topics(json)
    import_folders(json)
    import_projects(json)
  end

  def import_projects(json) do
    projects =
      json[:projects]
      |> Enum.map(&field_to_date(&1, :started))
      |> Enum.map(&rename_attribute(&1, :folder, :folder_id))
      |> Enum.map(&Map.delete(&1, :topics))

    projects_topics = Enum.flat_map(json[:projects], fn project ->
      for topic <- project[:topics], do: %{project_id: project.id, topic_id: topic}
    end)

    Repo.insert_all(Project, projects)
    Repo.insert_all("projects_topics", projects_topics)
  end

  defp import_topics(json) do
    Repo.insert_all(Topic, json[:topics])
  end

  def import_folders(json) do
    folders =
      json[:folders]
      |> Enum.sort_by(&(&1.id))
      |> Enum.map(&field_to_date(&1, :started))
      |> Enum.map(&rename_attribute(&1, :folder, :parent_id))

    Repo.insert_all(Folder, folders)
  end

  defp field_to_date(map, field) do
    Map.update!(map, field, &(Date.from_iso8601!(&1)))
  end

  defp rename_attribute(attrs, from, to) do
    attrs
    |> Map.put(to, attrs[from])
    |> Map.delete(from)
  end
end
