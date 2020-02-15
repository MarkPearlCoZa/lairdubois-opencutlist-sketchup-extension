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
      context "When testing the BinPacking Egning" do
        it "should do something" do
          options = BinPacking2D::Options.new
          options.base_bin_length = 2750
          options.base_bin_width = 1830
          options.rotatable = false
          options.saw_kerf = 1
          options.trimming = 1
          options.stacking = 1
          #options.bbox_optimization =
          #options.presort = presort
          e = BinPacking2D::PackEngine.new(options)
          result = e.run
          message = e.add_bin(100,100)
          expect(result).to eq [nil, 2]
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

