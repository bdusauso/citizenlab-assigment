defmodule Citizenlab.ProjectsTest do
  use Citizenlab.DataCase

  alias Citizenlab.Projects

  describe "projects" do
    alias Citizenlab.Projects.Project

    import Citizenlab.ProjectsFixtures

    @invalid_attrs %{description: nil, started: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", started: ~D[2022-02-09], title: "some title"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.started == ~D[2022-02-09]
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", started: ~D[2022-02-10], title: "some updated title"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.started == ~D[2022-02-10]
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "topics" do
    alias Citizenlab.Projects.Topic

    import Citizenlab.ProjectsFixtures

    @invalid_attrs %{title: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Projects.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Projects.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Topic{} = topic} = Projects.create_topic(valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Topic{} = topic} = Projects.update_topic(topic, update_attrs)
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_topic(topic, @invalid_attrs)
      assert topic == Projects.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Projects.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Projects.change_topic(topic)
    end
  end

  describe "folders" do
    alias Citizenlab.Projects.Folder

    import Citizenlab.ProjectsFixtures

    @invalid_attrs %{description: nil, started: nil, title: nil}

    test "list_folders/0 returns all folders" do
      folder = folder_fixture()
      assert Projects.list_folders() == [folder]
    end

    test "get_folder!/1 returns the folder with given id" do
      folder = folder_fixture()
      assert Projects.get_folder!(folder.id) == folder
    end

    test "create_folder/1 with valid data creates a folder" do
      valid_attrs = %{description: "some description", started: ~D[2022-02-09], title: "some title"}

      assert {:ok, %Folder{} = folder} = Projects.create_folder(valid_attrs)
      assert folder.description == "some description"
      assert folder.started == ~D[2022-02-09]
      assert folder.title == "some title"
    end

    test "create_folder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_folder(@invalid_attrs)
    end

    test "update_folder/2 with valid data updates the folder" do
      folder = folder_fixture()
      update_attrs = %{description: "some updated description", started: ~D[2022-02-10], title: "some updated title"}

      assert {:ok, %Folder{} = folder} = Projects.update_folder(folder, update_attrs)
      assert folder.description == "some updated description"
      assert folder.started == ~D[2022-02-10]
      assert folder.title == "some updated title"
    end

    test "update_folder/2 with invalid data returns error changeset" do
      folder = folder_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_folder(folder, @invalid_attrs)
      assert folder == Projects.get_folder!(folder.id)
    end

    test "delete_folder/1 deletes the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{}} = Projects.delete_folder(folder)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_folder!(folder.id) end
    end

    test "change_folder/1 returns a folder changeset" do
      folder = folder_fixture()
      assert %Ecto.Changeset{} = Projects.change_folder(folder)
    end
  end
end
