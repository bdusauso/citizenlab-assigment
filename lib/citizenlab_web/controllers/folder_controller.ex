defmodule CitizenlabWeb.FolderController do
  use CitizenlabWeb, :controller

  alias Citizenlab.Projects
  alias Citizenlab.Projects.Folder

  action_fallback CitizenlabWeb.FallbackController

  def index(conn, _params) do
    folders = Projects.list_folders()
    render(conn, "index.json", folders: folders)
  end

  def create(conn, %{"folder" => folder_params}) do
    with {:ok, %Folder{} = folder} <- Projects.create_folder(folder_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.folder_path(conn, :show, folder))
      |> render("show.json", folder: folder)
    end
  end

  def show(conn, %{"id" => id}) do
    folder = Projects.get_folder!(id)
    render(conn, "show.json", folder: folder)
  end

  def update(conn, %{"id" => id, "folder" => folder_params}) do
    folder = Projects.get_folder!(id)

    with {:ok, %Folder{} = folder} <- Projects.update_folder(folder, folder_params) do
      render(conn, "show.json", folder: folder)
    end
  end

  def delete(conn, %{"id" => id}) do
    folder = Projects.get_folder!(id)

    with {:ok, %Folder{}} <- Projects.delete_folder(folder) do
      send_resp(conn, :no_content, "")
    end
  end
end
