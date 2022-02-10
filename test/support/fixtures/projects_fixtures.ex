defmodule Citizenlab.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Citizenlab.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        started: ~D[2022-02-09],
        title: "some title"
      })
      |> Citizenlab.Projects.create_project()

    project
  end

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Citizenlab.Projects.create_topic()

    topic
  end

  @doc """
  Generate a folder.
  """
  def folder_fixture(attrs \\ %{}) do
    {:ok, folder} =
      attrs
      |> Enum.into(%{
        description: "some description",
        started: ~D[2022-02-09],
        title: "some title"
      })
      |> Citizenlab.Projects.create_folder()

    folder
  end
end
