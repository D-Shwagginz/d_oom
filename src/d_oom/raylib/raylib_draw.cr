module D_oom::Raylib
  def self.draw(&block)
    RL.begin_drawing
    RL.clear_background(RL::BLACK)
    yield
    RL.end_drawing
  end

  def self.draw_camera(camera : RL::Camera3D, &block)
    RL.begin_mode_3d(camera)
    yield
    RL.end_mode_3d
  end

  def self.draw_render_target(rt : RL::RenderTexture2D, &block)
    RL.begin_texture_mode(rt)
    RL.clear_background(RL::PURPLE)
    yield
    RL.end_texture_mode
  end
end
