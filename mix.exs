defmodule Uniflow.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      apps_path: "apps",
      version: @version,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [
      {:version_tasks, "~> 0.11.3"}
    ]
  end
end
