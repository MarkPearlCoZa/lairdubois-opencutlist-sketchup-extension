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
          expect(result[0].saw_kerf).to eq 1
            #expect(result[0].trimsize).to eq 1
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

