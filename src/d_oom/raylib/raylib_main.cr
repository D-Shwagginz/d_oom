module D_oom::Raylib
  alias Key = RL::KeyboardKey

  # Initializes the raylib window
  def self.init(title : String = "", fps : Int = 60, &block)
    RL.init_window(WINDOW_RES_X, WINDOW_RES_Y, title)
    RL.set_target_fps(fps)
    yield
    unload_render_textures()
    RL.close_window
  end

  def self.run_loop(exit_key : Key = Key::Escape, &block)
    RL.set_exit_key(exit_key)
    until RL.close_window?
      yield
    end
  end
end
