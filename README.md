# TsungDemo

Simple plug based project to be tested using tsung

## Run it manually

The versions required are defined in `.tool-versions` and can be installed with `asdf install`

Once the required versions of elixir and erlang are installed we can execute the following steps to run the project:

```shell
# Install dependencies
mix deps.get

# Run an interactive Iex session
iex -S mix
```

## Run it using docker

To run this app using docker run the following command:

```shell
docker run -e PORT=4000 -p 4000:4000 erickgnavar/tsung_demo
```
