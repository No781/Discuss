defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User
    alias Discuss.Router.Helpers

    def init(_params) do
    end

    def call(conn, _params) do # _params hereby refers to whatever the init function returns
        user_id = get_session(conn, :user_id)

        cond do
            user_id && Repo.get(User, user_id) ->
                assign(conn, :user, user_id) # -> struct conn.assigns.user
            true ->
                assign(conn, :user, nil)
        end
    end
end