defmodule ExaltWeb.HomeControllerTest do
  use ExaltWeb.ConnCase
  alias Exalt.Brain

  @valid_attrs %{title: "title", content: "some note", sort_order: 42}

  def fixture(:note, attr \\ %{}) do
    {:ok, note} = 
      attr
      |> Enum.into(@valid_attrs)
      |> Brain.create_note()
    note
  end

  describe "home show" do
    test "all notes show on page", %{conn: conn} do
      fixture(:note, %{title: "title 1", content: "some note"} )
      fixture(:note, %{title: "title 2", content: "another note"} )

      conn = get(conn, Routes.home_path(conn, :show))
      assert html_response(conn, 200) =~ "title 1"
      assert html_response(conn, 200) =~ "title 2"
    end
  end


  # describe "index" do
  #   test "lists all notes", %{conn: conn} do
  #     conn = get(conn, Routes.note_path(conn, :index))
  #     assert html_response(conn, 200) =~ "Listing Notes"
  #   end
  # end
  #
  # describe "new note" do
  #   test "renders form", %{conn: conn} do
  #     conn = get(conn, Routes.note_path(conn, :new))
  #     assert html_response(conn, 200) =~ "New Note"
  #   end
  # end
  #
  # describe "create note" do
  #   test "redirects to show when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.note_path(conn, :create), note: @create_attrs)
  #
  #     assert %{id: id} = redirected_params(conn)
  #     assert redirected_to(conn) == Routes.note_path(conn, :show, id)
  #
  #     conn = get(conn, Routes.note_path(conn, :show, id))
  #     assert html_response(conn, 200) =~ "Show Note"
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.note_path(conn, :create), note: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "New Note"
  #   end
  # end
  #
  # describe "edit note" do
  #   setup [:create_note]
  #
  #   test "renders form for editing chosen note", %{conn: conn, note: note} do
  #     conn = get(conn, Routes.note_path(conn, :edit, note))
  #     assert html_response(conn, 200) =~ "Edit Note"
  #   end
  # end
  #
  # describe "update note" do
  #   setup [:create_note]
  #
  #   test "redirects when data is valid", %{conn: conn, note: note} do
  #     conn = put(conn, Routes.note_path(conn, :update, note), note: @update_attrs)
  #     assert redirected_to(conn) == Routes.note_path(conn, :show, note)
  #
  #     conn = get(conn, Routes.note_path(conn, :show, note))
  #     assert html_response(conn, 200) =~ "some updated note"
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn, note: note} do
  #     conn = put(conn, Routes.note_path(conn, :update, note), note: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "Edit Note"
  #   end
  # end
  #
  # describe "delete note" do
  #   setup [:create_note]
  #
  #   test "deletes chosen note", %{conn: conn, note: note} do
  #     conn = delete(conn, Routes.note_path(conn, :delete, note))
  #     assert redirected_to(conn) == Routes.note_path(conn, :index)
  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.note_path(conn, :show, note))
  #     end
  #   end
  # end

  defp create_note(_) do
    note = fixture(:note)
    {:ok, note: note}
  end

end
