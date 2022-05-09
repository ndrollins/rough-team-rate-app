defmodule TeamRateWeb.PageController do
  use TeamRateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
