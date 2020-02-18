module Ladb
  module OpenCutList

    require_relative 'constants'
    require_relative 'lib/bin_packing_2d/packengine'

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
        #options.presort = presort
        #
        it "should return no placements if there are no boxes" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(2000,2000)
          result = e.run
          expect(result).to eq [nil, 2]
        end
        it "should return a single placement if there is one box that can fit" do
          e = BinPacking2D::PackEngine.new(options)
          e.add_bin(2000,2000)
          e.add_box(100,100);
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
          expect(result[0].original_bins[0].boxes[0].length).to eq 100
          expect(result[0].original_bins[0].boxes[0].width).to eq 100
          expect(result[0].original_bins[0].boxes[0].x).to eq 1
          expect(result[0].original_bins[0].boxes[0].y).to eq 1
          expect(result[0].original_bins[0].boxes[0].rotated).to eq false
          expect(result[0].original_bins[0].boxes[0].data).to eq nil
          expect(result[0].original_bins[0].boxes[0].sboxes).kind_of?(Array)
          expect(result[0].original_bins[0].boxes[0].is_superbox).to eq false
          #expect(result[0].original_bins[0].boxes[0].stack_is_horizontal).to eq true

          #expect(result[0].original_bins[0].max_x).to eq 101
          #expect(result[0].original_bins[0].max_y).to eq 101

          expect(result[0].unplaced_boxes).kind_of?(Array)
          expect(result[0].unused_bins).kind_of?(Array)
            #expect(result[0].b_x).to eq 0
            #expect(result[0].b_y).to eq 0
            #expect(result[0].b_w).to eq 1830
            #expect(result[0].b_l).to eq 2750
          #expect(result[0].stacking_maxlength).to eq 2000
          #expect(result[0].stacking_maxwidth).to eq 2000
          expect(result[0].performance).kind_of?(Array)


            #puts result.inspect
            #expect(result).to eq [nil, 2]
            #expect(result.saw_kerf).to eq 1
        end
      end
    end

    describe HelloWorld do
      context "When testing the HelloWorld class" do
        it "should say 'Hello World' when we call the say_hello method" do
          hw = HelloWorld.new
          message = hw.say_hello
          expect(message).to eq "Hello World!"
        end
      end
    end
  end
end

