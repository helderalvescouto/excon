defmodule Excon.GitApi.Behaviour do
  @callback build(String.t()) :: {:ok, [map()]} | {:error, String.t()}
end
