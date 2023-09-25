module D_oom
  def self.run
    Raylib.init(title: "Test") do
      # Creates the player and sets the camera
      player = Classes::Player.new
      camera = player.camera

      # Creates the player's viewport
      player_viewport = RL.load_render_texture(VIEWPORT_RES_X, VIEWPORT_RES_Y)
      Core.render_textures << player_viewport

      # Window Run Loop
      Raylib.run_loop do
        # Draws onto the render target
        Raylib.draw_render_target(player_viewport) do
          # Draws onto the camera
          Raylib.draw_camera(camera) do
            RL.draw_cube_v(RL::Vector3.new(z: -10), RL::Vector3.new(x: 2, y: 2, z: 2), RL::RED)
          end
        end

        # Draws onto the screen
        Raylib.draw do
          # Draws the player's viewport
          RL.draw_texture_pro(
            player_viewport.texture,
            RL::Rectangle.new(width: player_viewport.texture.width, height: -player_viewport.texture.height),
            RL::Rectangle.new(
              x: PLAYER_VIEWPORT_X,
              y: PLAYER_VIEWPORT_Y,
              width: PLAYER_VIEWPORT_WIDTH,
              height: PLAYER_VIEWPORT_HEIGHT
            ),
            RL::Vector2.new,
            0,
            RL::WHITE
          )
        end
      end
    end
  end
end
