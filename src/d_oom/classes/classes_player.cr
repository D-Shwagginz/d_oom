module D_oom::Classes
  class Player < Actor
    property camera : RL::Camera3D
    property speed_z : Float32
    property speed_x : Float32

    def initialize(
      location : RL::Vector3 = RL::Vector3.new(x: 1, y: 1, z: 1),
      rotation : RL::Vector3 = RL::Vector3.new,
      scale : RL::Vector3 = RL::Vector3.new(x: 1, y: 1, z: 1)
    )
      @location = location
      @rotation = rotation
      @scale = scale
      @name = "Player#{D_oom::Core.players.size}"
      @camera = RL::Camera3D.new(
        position: @location,
        target: RL::Vector3.new(x: -@location.x, y: @location.y, z: -@location.z),
        up: RL::Vector3.new(y: 1),
        fovy: D_oom::Core.calc_fov_y(PLAYER_FOV.to_f32),
        projection: RL::CameraProjection::Perspective
      )
      RL.camera_yaw(pointerof(@camera), D_oom::Core.deg2rad(-@rotation.y), false)
      RL.camera_pitch(pointerof(@camera), D_oom::Core.deg2rad(@rotation.x), true, false, false)
      RL.camera_roll(pointerof(@camera), D_oom::Core.deg2rad(@rotation.z))

      @speed_z = PLAYER_SPEED_Z.to_f32
      @speed_x = PLAYER_SPEED_X.to_f32
      D_oom::Core.players << self
      D_oom::Core.actors << self
    end
  end
end
