defmodule CitizenlabWeb.ProjectView do
  use CitizenlabWeb, :view
  alias CitizenlabWeb.{ProjectView, TopicView}

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{
      id: project.id,
      title: project.title,
      description: project.description,
      started: project.started,
      folder: show_folder(project),
      topics: render_many(project.topics, TopicView, "topic.json")
    }
  end

  defp show_folder(%{folder: nil}), do: []
  defp show_folder(%{folder: folder}), do: folder.id
end
