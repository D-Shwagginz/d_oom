module D_oom::Raylib
  def self.unload_render_textures
    D_oom::Core.render_textures.each do |rt|
      RL.unload_render_texture(rt)
    end

    D_oom::Core.render_textures.clear
  end
end
