defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("\n ===== Olá #{Game.player.name} O Jogo iniciou! =====\n")
    IO.inspect(Game.info())
    IO.puts("------------------------------------------")
  end
  def print_wrong_move_message(move) do
    IO.puts("\n ===== Movimento Inválido: #{move}. =====\n")
  end

  def print_move_message(:computer, :attack, damage, move) do
    IO.puts("\n ===== #{Game.player.name} atacou o computador com #{move} tirando #{damage}% de vida. =====\n")
  end
end
