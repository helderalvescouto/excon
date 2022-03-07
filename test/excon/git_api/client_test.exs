defmodule Excon.GitApi.ClientTest do
  use ExUnit.Case, async: true

  import Excon.Factory

  alias Plug.Conn
  alias Excon.GitApi.Client

  describe "user_repos/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when  there is valid username, returns the repos info", %{bypass: bypass} do
      username = "danilo-vieira"

      url = endpoint_url(bypass.port)

      body = %{
        "description" =>
          "Material necessário para realização do processamento de áudios para a disciplina Tópicos Especiais em Inteligência Artificial - UFPI",
        "html_url" => "https://github.com/danilo-vieira/audio_processing",
        "id" => 247_000_001,
        "name" => "audio_processing",
        "stargazers_count" => 0
      }

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.user_repos(url, username)

      expected_response = build(:repos_git)

      assert response == expected_response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}"
  end
end
