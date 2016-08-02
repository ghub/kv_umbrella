defmodule KV.RouterTest do
  use ExUnit.Case, async: true

  test "route requests across nodes" do
    assert KV.Router.route("hello", Kernel, :node, []) ==
      :"foo@MacBookPro"
    assert KV.Router.route("world", Kernel, :node, []) ==
      :"bar@MacBookPro"
  end

  test "raises on unkown entries" do
    assert_raise RuntimeError, ~r/Could not find entry/, fn ->
      KV.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end
