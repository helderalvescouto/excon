defmodule Excon.GitApi.Client do
  use Tesla

  alias Tesla.Env

  @base_url "https://api.github.com"
  plug Tesla.Middleware.JSON

  def user_repos(url \\ @base_url, login) do
    "#{url}/users/#{login}/repos"
    |> get()
    |> IO.inspect()
    |> handle_get(login)
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}, login) do
    new_map =
      body
      |> Enum.reduce([], fn map, acc ->
        [
          %{
            id: Map.get(map, "id"),
            name: handle_name(Map.get(map, "full_name"), login),
            description: Map.get(map, "description"),
            html_url: Map.get(map, "html_url"),
            stargazers_count: Map.get(map, "stargazers_count")
          }
          | acc
        ]
      end)
      |> Enum.reverse()

    {:ok, new_map}
  end

  defp handle_get({:ok, %Env{status: _400, body: body}}, _login), do: {:error, body}

  defp handle_get({:error, reason}, _login), do: {:error, reason}

  defp handle_name(full_name, login) do
    tam = String.length(login) + 1

    full_name
    |> String.slice(tam..-1)
  end
end
