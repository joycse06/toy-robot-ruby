require 'spec_helper'

describe 'Direction' do

  describe 'find directions' do
    it 'finds NORTH direction' do
       expect( Direction['NORTH'] ).to be Diretion.NORTH
    end
    it 'finds SOUTH direction' do
      expect( Direction['SOUTH'] ).to be Direction.SOUTH
    end
    it 'finds EAST direction' do
      expect( Direction['EAST'] ).to be Direction.EAST
    end
    it 'finds WEST direction' do
      expect( Direction['WEST'] ).to be Direction.WEST
    end

    it 'doesn\'t find invalid direction' do
      expect( Direction['INVALID'] ).to be_nil
    end
  end

  describe 'turns left' do
    it 'can turn left from NORTH' do
      expect( Direction.left Direction.NORTH ).to be Direction.WEST
    end
    it 'can turn left from EAST' do
      expect( Direction.left Direction.EAST ).to be Direction.NORTH
    end
    it 'can turn left from WEST' do
      expect( Direction.left Direction.SOUTH ).to be Direction.EAST
    end
    it 'can turn left from SOUTH' do
      expect( Direction.left Direction.WEST ).to be Direction.SOUTH
    end
  end

  describe 'turns right' do
    it 'can turn right from NORTH' do
      expect( Direction.right Direction.NORTH ).to be Direction.EAST
    end
    it 'can turn right from EAST' do
      expect( Direction.right Direction.EAST ).to be Direction.SOUTH
    end
    it 'can turn right from WEST' do
      expect( Direction.right Direction.SOUTH ).to be Direction.WEST
    end
    it 'can turn right from SOUTH' do
      expect( Direction.right Direction.WEST ).to be Direction.NORTH
    end
  end
end