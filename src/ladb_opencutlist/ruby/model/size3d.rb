module Ladb::OpenCutList

  require_relative 'size2d'

  class Size3d < Size2d

    attr_accessor :thickness

    def initialize(length = 0, width = 0, thickness = 0)
      if length.is_a? String
        s_length, s_width, s_thickness = StringUtils.split_dxdxd(length)
        length = s_length.to_l
        width = s_width.to_l
        thickness = s_thickness.to_l
      end
      super(length, width)
      @thickness = thickness
    end

    # -----

    def self.create_from_bounds(bounds, scale, auto_orient = true)
      if auto_orient
        ordered = [(bounds.width * scale.x).to_l, (bounds.height * scale.y).to_l, (bounds.depth * scale.z).to_l].sort
        Size3d.new(ordered[2], ordered[1], ordered[0])
      else
        Size3d.new((bounds.width * scale.x).to_l, (bounds.height * scale.y).to_l, (bounds.depth * scale.z).to_l)
      end
    end

    # -----

    def volume
      area * @thickness
    end

    def volume_m3
      area_m2 * @thickness.to_m
    end

    # -----

    def to_s
      'Size3d(' + @length.to_l.to_s + ', ' + @width.to_l.to_s + ', ' + @thickness.to_l.to_s + ')'
    end

  end

end
