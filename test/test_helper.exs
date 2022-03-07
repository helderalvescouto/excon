ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Excon.Repo, :manual)

Mox.defmock(Excon.GitApi.ClientMock, for: Excon.GitApi.Behaviour)
