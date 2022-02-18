defmodule Excon.Factory do
  use ExMachina.Ecto, repo: Excon.Repo

  def repos_git_factory do
    %{
      description:
        "Material necessário para realização do processamento de áudios para a disciplina Tópicos Especiais em Inteligência Artificial - UFPI",
      html_url: "https://github.com/danilo-vieira/audio_processing",
      id: 247_000_001,
      name: "audio_processing",
      stargazers_count: 0
    }
  end
end
