defmodule TsungDemo.DB do
  use GenServer

  @users [
    %{name: "user1", email: "user1@example.com"},
    %{name: "user2", email: "user2@example.com"},
    %{name: "user3", email: "user3@example.com"},
    %{name: "user4", email: "user4@example.com"},
    %{name: "user5", email: "user5@example.com"}
  ]

  def start_link(_opts) do
    initial_state = @users
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  # public api

  def list_users do
    GenServer.call(__MODULE__, :list_users)
  end

  def add_user(user) do
    GenServer.cast(__MODULE__, {:add_user, user})
  end

  # private api

  @impl true
  def handle_call(:list_users, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add_user, user}, state) do
    {:noreply, [user | state]}
  end
end
