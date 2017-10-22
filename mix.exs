defmodule Cli.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cli,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Cli, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tic_tac_toe, "~> 1.0.0"},
    ]
  end
end
