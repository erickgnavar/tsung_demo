import Config

config :tsung_demo, :http_port, String.to_integer(System.get_env("PORT"))
