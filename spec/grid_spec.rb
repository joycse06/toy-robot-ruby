require 'spec_helper'

describe 'Grid' do
  let(:grid) { Grid.new 4, 4 }

  describe '#inside' do

    it "determines X,Y in 0..4 range is inside grid" do
      expect(grid.inside?(2,3)).to be true
    end
    it "determines X < 0 is not inside grid" do
      expect(grid.inside?(-1,0)).to be false
    end

    it "determines X > 4 is not inside grid" do
      expect(grid.inside?(5, 0)).to be false
    end

    it "determines Y < 0 is not inside grid" do
      expect(grid.inside?(0,-1)).to be false
    end

    it "determines Y > 4 is not inside grid" do
      expect(grid.inside?(0, 5)).to be false
    end

  end
end