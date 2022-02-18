defmodule Excon.GitApi.ClientTest do
  use ExUnit.Case, async: true

  import Excon.Factory

  alias Plug.Conn
  alias Excon.GitApi.Client

  describe "build/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when  there is valid username, returns the repos info", %{bypass: bypass} do
      username = "danilo-vieira"

      url = endpoint_url(bypass.port)

      body = ~S({ "cep": "01001-000" })

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "text/plain")
        |> Conn.resp(200, body)
      end)

      response = Client.build(url, username)

      expected_response = {:ok, [build(:repos_git)]}

      assert response == expected_response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
