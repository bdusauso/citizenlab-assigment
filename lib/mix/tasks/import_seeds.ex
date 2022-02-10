defmodule Mix.Tasks.Citizenlab.ImportSeeds do
  use Mix.Task

  @shortdoc "Import seeds from 'sample_data.json'"


  def run(_args) do
    Citizenlab.Importer.import()
  end
end
