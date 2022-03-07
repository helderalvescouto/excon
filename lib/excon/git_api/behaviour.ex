defmodule Excon.GitApi.Behaviour do
  @callback user_repos(String.t()) :: {:ok, [map()]} | {:error, String.t()}
end
