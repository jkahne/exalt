defmodule HomeTest do
  use Exalt.DataCase
  use Hound.Helpers
  alias Exalt.Brain

  @valid_attrs %{title: "some title", content: "some note", sort_order: 1}

  hound_session()

  def fixture(:note, attr \\ %{}) do
    {:ok, note} = 
      attr
      |> Enum.into(@valid_attrs)
      |> Brain.create_note()
    note
  end

  setup do
    fixture(:note, %{title: "title1a", content: "some note"} )
    fixture(:note, %{title: "title2a", content: "another note"} )
    navigate_to("http://localhost:4002/home")
    assert visible_in_page?(~r/title1/)
    assert visible_in_page?(~r/title2/)
    :ok
  end

  test "shows only matching notes" do
    fill_field({:id, "title_title"}, "title1")
    assert visible_in_page?(~r/title1a/)
    assert !visible_in_page?(~r/title2b/)
  end

  test "shows note that is clicked on" do
    click({:id, "title1a"})
    content = find_element(:css, "#note_content") |> inner_text
    assert content ==  "some note"
  end

  test "" do

  end

end

