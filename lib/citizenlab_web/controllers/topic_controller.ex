defmodule CitizenlabWeb.TopicController do
  use CitizenlabWeb, :controller

  alias Citizenlab.Projects
  alias Citizenlab.Projects.Topic

  action_fallback CitizenlabWeb.FallbackController

  def index(conn, _params) do
    topics = Projects.list_topics()
    render(conn, "index.json", topics: topics)
  end

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, %Topic{} = topic} <- Projects.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.topic_path(conn, :show, topic))
      |> render("show.json", topic: topic)
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Projects.get_topic!(id)
    render(conn, "show.json", topic: topic)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Projects.get_topic!(id)

    with {:ok, %Topic{} = topic} <- Projects.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Projects.get_topic!(id)

    with {:ok, %Topic{}} <- Projects.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
  end
end
