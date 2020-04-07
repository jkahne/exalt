defmodule Exalt.BrainTest do
  use Exalt.DataCase

  alias Exalt.Brain

  describe "notes" do
    alias Exalt.Brain.Note

    @valid_attrs %{note: "some note", sort_order: 42}
    @update_attrs %{note: "some updated note", sort_order: 43}
    @invalid_attrs %{note: nil, sort_order: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brain.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Brain.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Brain.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Brain.create_note(@valid_attrs)
      assert note.note == "some note"
      assert note.sort_order == 42
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brain.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Brain.update_note(note, @update_attrs)
      assert note.note == "some updated note"
      assert note.sort_order == 43
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Brain.update_note(note, @invalid_attrs)
      assert note == Brain.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Brain.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Brain.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Brain.change_note(note)
    end
  end
end
