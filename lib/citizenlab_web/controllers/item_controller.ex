defmodule CitizenlabWeb.ItemController do
  use CitizenlabWeb, :controller
  alias Citizenlab.Projects

  def index(conn, %{"parent" => folder_id}) do
    projects = Projects.list_projects(folder_id)
    folders = Projects.list_folders(folder_id)

    render(conn, "show.json", projects: projects, folders: folders)
  end

  def index(conn, _params) do
    projects = Projects.list_projects()
    folders = Projects.list_folders()

    render(conn, "show.json", projects: projects, folders: folders)
  end
end
