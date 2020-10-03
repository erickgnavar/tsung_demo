defmodule TsungDemo.Router do
  use Plug.Router

  plug(Plug.RequestId)
  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  alias TsungDemo.DB

  @html_content ~S{
    <h1>hello world</h1>
    <p>This is a test for tsung blogpost</p>
  }

  get "/" do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, @html_content)
  end

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get "/users" do
    payload = %{
      "data" => DB.list_users()
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(payload))
  end

  post "/users" do
    params = conn.body_params

    DB.add_user(params)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Jason.encode!(params))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
