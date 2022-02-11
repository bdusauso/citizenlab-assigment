defmodule Mix.Tasks.Citizenlab.ImportSeeds do
  use Mix.Task

  @shortdoc "Import seeds from 'sample_data.json'"

  def run(_args) do
    init()
    Citizenlab.Importer.import()
  end

  def init() do
    Application.ensure_all_started(:citizenlab)
  end
end
