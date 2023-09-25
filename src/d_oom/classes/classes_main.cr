module D_oom::Classes
  class Actor
    property location : RL::Vector3
    property rotation : RL::Vector3
    property scale : RL::Vector3
    getter name : String

    def initialize(
      location : RL::Vector3 = RL::Vector3.new,
      rotation : RL::Vector3 = RL::Vector3.new,
      scale : RL::Vector3 = RL::Vector3.new(x: 1, y: 1, z: 1),
      name : String = "No Name"
    )
      @location = location
      @rotation = rotation
      @scale = scale
      @name = name
      @@actors << self
    end
  end
end
