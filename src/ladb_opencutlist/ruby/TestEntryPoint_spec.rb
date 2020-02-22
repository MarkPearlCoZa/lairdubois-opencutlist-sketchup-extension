require 'simplecov'
SimpleCov.start


module Ladb
  module OpenCutList

    require_relative 'constants'
    require_relative 'lib/bin_packing_2d/packengine'
    require 'rspec'

    class HelloWorld
      def say_hello
        "Hello World!"
      end
    end


    describe BinPacking2D do
      context "When testing the BinPacking Engine" do
        options = BinPacking2D::Options.new
        options.base_bin_length = 2750
        options.base_bin_width = 1830
        options.rotatable = false
        options.saw_kerf = 1
        options.trimming = 1
        options.stacking = 1
        #options.bbox_optimization =
        #
        it "should return a double placement if there are two box that can fit" do
          options.presort = BinPacking2D::PRESORT_LENGTH_DECR
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(2000, 2000)
          e.add_box(200, 300)
          e.add_box(200, 300)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result).kind_of?(Array)
          expect(result[0].score).to eq 0
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 4
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2000
          expect(result[0].original_bins[0].width).to eq 2000
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 2
          expect(result[0].original_bins[0].boxes[0].length).to eq 200
          expect(result[0].original_bins[0].boxes[0].width).to eq 300
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].boxes[1].length).to eq 200
          expect(result[0].original_bins[0].boxes[1].width).to eq 300
          expect(result[0].original_bins[0].boxes[1].x).to eq 202
          expect(result[0].original_bins[0].boxes[1].y).to eq 1
          expect(result[0].original_bins[0].boxes[1].rotated).to eq false
          expect(result[0].original_bins[0].boxes[1].data).to eq nil
          expect(result[0].original_bins[0].boxes[1].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[1].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 3
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 301
          expect(result[0].original_bins[0].cuts[0].length).to eq 1998
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 402
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 300
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].cuts[2].x).to eq 201
          expect(result[0].original_bins[0].cuts[2].y).to eq 1
          expect(result[0].original_bins[0].cuts[2].length).to eq 300
          expect(result[0].original_bins[0].cuts[2].is_primary).to eq false
          expect(result[0].original_bins[0].cuts[2].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 2598
          expect(result[0].original_bins[0].efficiency).to eq 3.0

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 1998
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1697
          expect(result[0].original_bins[0].leftovers[0].type).to eq 1
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 302
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 1596
          expect(result[0].original_bins[0].leftovers[1].width).to eq 300
          expect(result[0].original_bins[0].leftovers[1].type).to eq 1
          expect(result[0].original_bins[0].leftovers[1].x).to eq 403
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 0

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 1998
          expect(result[0].performance.largest_leftover_width).to eq 1697
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 2
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0

        end

        it "should return a single placement variation 2 if there is one box that can fit" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(2000, 2000)
          e.add_box(200, 300)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result).kind_of?(Array)
          expect(result[0].score).to eq 0
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 0
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2000
          expect(result[0].original_bins[0].width).to eq 2000
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 1
          expect(result[0].original_bins[0].boxes[0].length).to eq 200
          expect(result[0].original_bins[0].boxes[0].width).to eq 300
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 2
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 301
          expect(result[0].original_bins[0].cuts[0].length).to eq 1998
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 201
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 300
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 2298
          expect(result[0].original_bins[0].efficiency).to eq 1.5

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 1998
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1697
          expect(result[0].original_bins[0].leftovers[0].type).to eq 1
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 302
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 1797
          expect(result[0].original_bins[0].leftovers[1].width).to eq 300
          expect(result[0].original_bins[0].leftovers[1].type).to eq 1
          expect(result[0].original_bins[0].leftovers[1].x).to eq 202
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 0

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 1998
          expect(result[0].performance.largest_leftover_width).to eq 1697
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 1
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0

        end
        it "should return a single placement if there is one box that can fit" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(2000, 2000)
          e.add_box(100, 100)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result).kind_of?(Array)
          expect(result[0].score).to eq 0
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 0
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2000
          expect(result[0].original_bins[0].width).to eq 2000
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 1
          expect(result[0].original_bins[0].boxes[0].length).to eq 100
          expect(result[0].original_bins[0].boxes[0].width).to eq 100
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 2
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 101
          expect(result[0].original_bins[0].cuts[0].length).to eq 1998
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 101
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 100
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 2098
          expect(result[0].original_bins[0].efficiency).to eq 0.25

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 1998
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1897
          expect(result[0].original_bins[0].leftovers[0].type).to eq 1
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 102
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 1897
          expect(result[0].original_bins[0].leftovers[1].width).to eq 100
          expect(result[0].original_bins[0].leftovers[1].type).to eq 1
          expect(result[0].original_bins[0].leftovers[1].x).to eq 102
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0]./original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 0

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 1998
          expect(result[0].performance.largest_leftover_width).to eq 1897
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 1
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0

        end
        it "should return a single placement if there is one box that can fit" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(200, 300)
          e.add_box(400, 500)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result).kind_of?(Array)
          expect(result[0].score).to eq 5
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 5
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2750
          expect(result[0].original_bins[0].width).to eq 1830
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 1
          expect(result[0].original_bins[0].boxes[0].length).to eq 400
          expect(result[0].original_bins[0].boxes[0].width).to eq 500
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 2
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 501
          expect(result[0].original_bins[0].cuts[0].length).to eq 2748
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 401
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 500
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 3248
          expect(result[0].original_bins[0].efficiency).to eq 3.974167908594138

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 2748
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1327
          expect(result[0].original_bins[0].leftovers[0].type).to eq 0
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 502
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq true
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 2347
          expect(result[0].original_bins[0].leftovers[1].width).to eq 500
          expect(result[0].original_bins[0].leftovers[1].type).to eq 0
          expect(result[0].original_bins[0].leftovers[1].x).to eq 402
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0]./original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq true
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 1
          expect(result[0].unused_bins[0].length).to eq 200
          expect(result[0].unused_bins[0].width).to eq 300
          expect(result[0].unused_bins[0].type).to eq 1
          expect(result[0].unused_bins[0].trimsize).to eq 1
          #expect(result[0].unused_bins[0].cleaned).to eq true

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 2748
          expect(result[0].performance.largest_leftover_width).to eq 1327
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 1
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0
        end
        it "no bins" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_box(200, 300)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result[0].score).to eq 5
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 5
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2750
          expect(result[0].original_bins[0].width).to eq 1830
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 1
          expect(result[0].original_bins[0].boxes[0].length).to eq 200
          expect(result[0].original_bins[0].boxes[0].width).to eq 300
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 2
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 301
          expect(result[0].original_bins[0].cuts[0].length).to eq 2748
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 201
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 300
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 3048
          expect(result[0].original_bins[0].efficiency).to eq 1.1922503725782414

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 2748
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1527
          expect(result[0].original_bins[0].leftovers[0].type).to eq 0
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 302
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 2547
          expect(result[0].original_bins[0].leftovers[1].width).to eq 300
          expect(result[0].original_bins[0].leftovers[1].type).to eq 0
          expect(result[0].original_bins[0].leftovers[1].x).to eq 202
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0]./original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq false
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 0
          #expect(result[0].unused_bins[0].cleaned).to eq true

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 2748
          expect(result[0].performance.largest_leftover_width).to eq 1527
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 1
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0
        end
        it "perfect fit" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(200, 300)
          e.add_box(200, 300)
          result = e.run
          expect(result).is_a?(BinPacking2D)
          expect(result[0].score).to eq 5
          expect(result[0].saw_kerf).to eq 1
          # expect(result[0].trimsize).to eq 1
          expect(result[0].split).to eq 5
          #expect(result[0].rotatable).to eq false
          expect(result[0].original_bins).kind_of?(Array)
          expect(result[0].original_bins.length).to eq 1
          expect(result[0].original_bins[0].length).to eq 2750
          expect(result[0].original_bins[0].width).to eq 1830
          expect(result[0].original_bins[0].x).to eq 0
          expect(result[0].original_bins[0].y).to eq 0

          expect(result[0].original_bins[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes.length).to eq 1
          expect(result[0].original_bins[0].boxes[0].length).to eq 200
          expect(result[0].original_bins[0].boxes[0].width).to eq 300
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

          expect(result[0].original_bins[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].cuts.length).to eq 2
          expect(result[0].original_bins[0].cuts[0].x).to eq 1
          expect(result[0].original_bins[0].cuts[0].y).to eq 301
          expect(result[0].original_bins[0].cuts[0].length).to eq 2748
          expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

          expect(result[0].original_bins[0].cuts[1].x).to eq 201
          expect(result[0].original_bins[0].cuts[1].y).to eq 1
          expect(result[0].original_bins[0].cuts[1].length).to eq 300
          expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
          expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

          expect(result[0].original_bins[0].total_length_cuts).to eq 3048
          expect(result[0].original_bins[0].efficiency).to eq 1.1922503725782414

          expect(result[0].original_bins[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers.length).to eq 2
          expect(result[0].original_bins[0].leftovers[0].length).to eq 2748
          expect(result[0].original_bins[0].leftovers[0].width).to eq 1527
          expect(result[0].original_bins[0].leftovers[0].type).to eq 0
          expect(result[0].original_bins[0].leftovers[0].x).to eq 1
          expect(result[0].original_bins[0].leftovers[0].y).to eq 302
          #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[0].trimmed).to eq true
          expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

          expect(result[0].original_bins[0].leftovers[1].length).to eq 2547
          expect(result[0].original_bins[0].leftovers[1].width).to eq 300
          expect(result[0].original_bins[0].leftovers[1].type).to eq 0
          expect(result[0].original_bins[0].leftovers[1].x).to eq 202
          expect(result[0].original_bins[0].leftovers[1].y).to eq 1
          #expect(result[0]./original_bins[0].leftovers[1].max_x).to eq 0
          #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
          expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
          expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
          expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
          expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
          expect(result[0].original_bins[0].leftovers[1].trimmed).to eq true
          expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
          #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
          #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

          expect(result[0].original_bins[0].trimmed).to eq true
          expect(result[0].original_bins[0].trimsize).to eq 1
          #expect(result[0].original_bins[0].bbox_done).to eq false

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unplaced_boxes.length).to eq 0

          expect(result[0].unused_bins).kind_of?(Array)
          expect(result[0].unused_bins.length).to eq 1
          expect(result[0].unused_bins[0].length).to eq 200
          expect(result[0].unused_bins[0].width).to eq 300

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          #expect(result[0].b_x).to eq 0
          #expect(result[0].b_y).to eq 0
          #expect(result[0].b_w).to eq 1830
          #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance.largest_leftover_length).to eq 2748
          expect(result[0].performance.largest_leftover_width).to eq 1527
          expect(result[0].performance.nb_bins).to eq 1
          expect(result[0].performance.nb_boxes_packed).to eq 1
          expect(result[0].performance.nb_leftovers).to eq 2
          #expect(result[0].performance.packing_quality).to eq 0
        end
      end
      context "when things are rotateable"
      options = BinPacking2D::Options.new
      options.base_bin_length = 2750
      options.base_bin_width = 1830
      options.rotatable = true
      options.saw_kerf = 1
      options.trimming = 1
      options.stacking = 1
      it "should return a single placement variation 2 if there is one box that can fit" do
        e = BinPacking2D::PackEngine.new(options)
        e.add_bin(2000, 2000)
        e.add_box(200, 300)
        result = e.run
        expect(result).is_a?(BinPacking2D)
        expect(result).kind_of?(Array)
        expect(result[0].score).to eq 0
        expect(result[0].saw_kerf).to eq 1
        # expect(result[0].trimsize).to eq 1
        expect(result[0].split).to eq 0
        #expect(result[0].rotatable).to eq false
        expect(result[0].original_bins).kind_of?(Array)
        expect(result[0].original_bins.length).to eq 1
        expect(result[0].original_bins[0].length).to eq 2000
        expect(result[0].original_bins[0].width).to eq 2000
        expect(result[0].original_bins[0].x).to eq 0
        expect(result[0].original_bins[0].y).to eq 0

        expect(result[0].original_bins[0].boxes).kind_of?(Array)
        expect(result[0].original_bins[0].boxes.length).to eq 1
        expect(result[0].original_bins[0].boxes[0].length).to eq 200
        expect(result[0].original_bins[0].boxes[0].width).to eq 300
        expect(result[0].original_bins[0].boxes[0].x).to eq 1
        expect(result[0].original_bins[0].boxes[0].y).to eq 1
        expect(result[0].original_bins[0].boxes[0].rotated).to eq false
        expect(result[0].original_bins[0].boxes[0].data).to eq nil
        expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
        expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false

        expect(result[0].original_bins[0].cuts).kind_of?(Array)
        expect(result[0].original_bins[0].cuts.length).to eq 2
        expect(result[0].original_bins[0].cuts[0].x).to eq 1
        expect(result[0].original_bins[0].cuts[0].y).to eq 301
        expect(result[0].original_bins[0].cuts[0].length).to eq 1998
        expect(result[0].original_bins[0].cuts[0].is_primary).to eq true
        expect(result[0].original_bins[0].cuts[0].is_horizontal).to eq true

        expect(result[0].original_bins[0].cuts[1].x).to eq 201
        expect(result[0].original_bins[0].cuts[1].y).to eq 1
        expect(result[0].original_bins[0].cuts[1].length).to eq 300
        expect(result[0].original_bins[0].cuts[1].is_primary).to eq true
        expect(result[0].original_bins[0].cuts[1].is_horizontal).to eq false

        expect(result[0].original_bins[0].total_length_cuts).to eq 2298
        expect(result[0].original_bins[0].efficiency).to eq 1.5

        expect(result[0].original_bins[0].leftovers).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers.length).to eq 2
        expect(result[0].original_bins[0].leftovers[0].length).to eq 1998
        expect(result[0].original_bins[0].leftovers[0].width).to eq 1697
        expect(result[0].original_bins[0].leftovers[0].type).to eq 1
        expect(result[0].original_bins[0].leftovers[0].x).to eq 1
        expect(result[0].original_bins[0].leftovers[0].y).to eq 302
        #expect(result[0].original_bins[0].leftovers[0].max_x).to eq 0
        #expect(result[0].original_bins[0].leftovers[0].max_y).to eq 0
        expect(result[0].original_bins[0].leftovers[0].boxes).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[0].boxes.length).to eq 0
        expect(result[0].original_bins[0].leftovers[0].cuts).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[0].cuts.length).to eq 0
        expect(result[0].original_bins[0].leftovers[0].total_length_cuts).to eq 0
        expect(result[0].original_bins[0].leftovers[0].efficiency).to eq 0
        expect(result[0].original_bins[0].leftovers[0].leftovers).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[0].leftovers.length).to eq 0
        expect(result[0].original_bins[0].leftovers[0].trimmed).to eq false
        expect(result[0].original_bins[0].leftovers[0].trimsize).to eq 1
        #expect(result[0].original_bins[0].leftovers[0].bbox_done).to eq true
        #expect(result[0].original_bins[0].leftovers[0].cleaned).to eq true

        expect(result[0].original_bins[0].leftovers[1].length).to eq 1797
        expect(result[0].original_bins[0].leftovers[1].width).to eq 300
        expect(result[0].original_bins[0].leftovers[1].type).to eq 1
        expect(result[0].original_bins[0].leftovers[1].x).to eq 202
        expect(result[0].original_bins[0].leftovers[1].y).to eq 1
        #expect(result[0].original_bins[0].leftovers[1].max_x).to eq 0
        #expect(result[0].original_bins[0].leftovers[1].max_y).to eq 0
        expect(result[0].original_bins[0].leftovers[1].boxes).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[1].boxes.length).to eq 0
        expect(result[0].original_bins[0].leftovers[1].cuts).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[1].cuts.length).to eq 0
        expect(result[0].original_bins[0].leftovers[1].total_length_cuts).to eq 0
        expect(result[0].original_bins[0].leftovers[1].efficiency).to eq 0
        expect(result[0].original_bins[0].leftovers[1].leftovers).kind_of?(Array)
        expect(result[0].original_bins[0].leftovers[1].leftovers.length).to eq 0
        expect(result[0].original_bins[0].leftovers[1].trimmed).to eq false
        expect(result[0].original_bins[0].leftovers[1].trimsize).to eq 1
        #expect(result[0].original_bins[0].leftovers[1].bbox_done).to eq true
        #expect(result[0].original_bins[0].leftovers[1].cleaned).to eq true

        expect(result[0].original_bins[0].trimmed).to eq true
        expect(result[0].original_bins[0].trimsize).to eq 1
        #expect(result[0].original_bins[0].bbox_done).to eq false

        expect(result[0].unplaced_boxes).kind_of?(Array)
        expect(result[0].unplaced_boxes.length).to eq 0

        expect(result[0].unused_bins).kind_of?(Array)
        expect(result[0].unused_bins.length).to eq 0

        #expect(result[0].original_bins[0].max_x).to eq 101
        #expect(result[0].original_bins[0].max_y).to eq 101

        #expect(result[0].b_x).to eq 0
        #expect(result[0].b_y).to eq 0
        #expect(result[0].b_w).to eq 1830
        #expect(result[0].b_l).to eq 2750
        #expect(result[0].stacking_maxlength).to eq 2000
        #expect(result[0].stacking_maxwidth).to eq 2000
        expect(result[0].performance.largest_leftover_length).to eq 1998
        expect(result[0].performance.largest_leftover_width).to eq 1697
        expect(result[0].performance.nb_bins).to eq 1
        expect(result[0].performance.nb_boxes_packed).to eq 1
        expect(result[0].performance.nb_leftovers).to eq 2
        #expect(result[0].performance.packing_quality).to eq 0

      end
    end
    context "When testing the BinPacking Engine with zero base bin width/length" do
      options = BinPacking2D::Options.new
      options.base_bin_length = 0
      options.base_bin_width = 0
      options.rotatable = false
      options.saw_kerf = 1
      options.trimming = 1
      options.stacking = 1
      options.presort = BinPacking2D::PRESORT_INPUT_ORDER
      #options.bbox_optimization =
      #options.presort = presort
      #
      it "no bin" do
        e = BinPacking2D::PackEngine.new(options)
        result = e.run
        expect(result).is_a?(BinPacking2D)
        expect(result).to eq [nil, 1]
      end
      it "should return no placements if there are no boxes" do
        e = BinPacking2D::PackEngine.new(options)
        e.add_bin(2000, 2000)
        result = e.run
        expect(result).to eq [nil, 2]
      end
    end
  end
end

