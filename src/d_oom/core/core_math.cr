module D_oom::Core
  def self.deg2rad(degrees : Int | Float)
    return degrees*(Math::PI/180)
  end

  def self.rad2deg(radians : Int | Float)
    return radians*(180/Math::PI)
  end

  def self.calc_fov_x(fov_y : Float)
    fov_y = fov_y.clamp(1, 179)

    width = RL.get_screen_width
    height = RL.get_screen_height

    y = height / Math.tan(fov_y / 360 * Math::PI)
    a = Math.atan(width / y)
    a = a * 360 / Math::PI

    return a
  end

  def self.calc_fov_y(fov_x : Float)
    fov_x = fov_x.clamp(1, 179)

    width = FOV_BASE_WIDTH
    height = FOV_BASE_HEIGHT

    x = width / Math.tan(fov_x / 360 * Math::PI)
    a = Math.atan(height / x)
    a = a * 360 / Math::PI

    return a
  end
end
