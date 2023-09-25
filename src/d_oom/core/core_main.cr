module D_oom::Core
  enum GameState
    Menu
    Play
  end

  class_property actors : Array(D_oom::Classes::Actor) = [] of D_oom::Classes::Actor
  class_property players : Array(D_oom::Classes::Player) = [] of D_oom::Classes::Player
  class_property render_textures : Array(RL::RenderTexture2D) = [] of RL::RenderTexture2D
  class_property game_state : GameState = GameState::Menu
end
