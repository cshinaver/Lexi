defmodule LexiWeb.ErrorJSONTest do
  use LexiWeb.ConnCase, async: true

  test "renders 404" do
    assert LexiWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LexiWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
