defmodule CitizenlabWeb.ItemView do
  use CitizenlabWeb, :view
  alias CitizenlabWeb.{FolderView, ProjectView}

  def render("show.json", %{projects: projects, folders: folders}) do
    %{
      projects: render_many(projects, ProjectView, "project.json", as: :project),
      folders: render_many(folders, FolderView, "folder.json", as: :folder)
    }
  end
end
