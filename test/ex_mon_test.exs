defmodule ExMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias ExMon.Player

  describe "create_player/4" do
    test "create a player for the game" do
      # Arrange
      name = "Jeanderson"
      move_avg = :soco
      move_rnd = :chute
      move_hel = :cura

      # Act
      expected_response = %ExMon.Player{
        life: 100,
        moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
        name: "Jeanderson"
      }

      # Assert
      assert ExMon.create_player(name, move_avg, move_rnd, move_hel) == expected_response
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Jeanderson", :chute, :soco, :cura)
      
      messages= 
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "O Jogo iniciou!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do 
      player = Player.build("Jeanderson", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages= 
      capture_io(fn ->
        assert ExMon.make_move(:soco)
      end)
      
      assert messages =~ "atacou Thor tirando"
      assert messages =~ "Eh a vez de computer jogar!"
      assert messages =~ "status: :continue"
      assert messages =~ "turn: :computer"
      assert messages =~ "Eh a vez de player jogar!"
      assert messages =~ "turn: :player"
    end

    test "when the move is invalid, returns an error message" do
      messages= 
      capture_io(fn ->
        assert ExMon.make_move(:invalid_move)
      end)
      
      assert messages =~ "Movimento Inválido: invalid_move."
    end
  end
end
