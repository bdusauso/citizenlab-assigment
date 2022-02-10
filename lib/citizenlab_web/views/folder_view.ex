defmodule CitizenlabWeb.FolderView do
  use CitizenlabWeb, :view
  alias CitizenlabWeb.FolderView

  def render("index.json", %{folders: folders}) do
    %{data: render_many(folders, FolderView, "folder.json")}
  end

  def render("show.json", %{folder: folder}) do
    %{data: render_one(folder, FolderView, "folder.json")}
  end

  def render("folder.json", %{folder: folder}) do
    %{
      id: folder.id,
      title: folder.title,
      description: folder.description,
      started: folder.started
    }
  end
end
