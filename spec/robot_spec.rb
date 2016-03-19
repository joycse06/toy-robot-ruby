require 'spec_helper'

describe Robot do
  let(:robot) { Robot.new( Grid.new( 4, 4 ) ) }

  describe 'creation' do
    it 'can create new robot' do
      expect(robot).to be_a Robot
    end
  end

  describe 'placement' do
    context 'valid placement' do
      before do
        robot.place( 1, 1, 'SOUTH' )
      end
      it 'reports position as 1,1,SOUTH' do
        expect(robot.report).to eq('1,1,SOUTH')
      end
    end

    context 'invalid placement' do
      before do
        robot.place( 5, -1, 'SOUTH' )
      end

      it 'ignores reporting' do
        expect(robot.report).to be_nil
      end
    end
  end

  describe 'turning left' do
    context 'turning left from EAST' do
      before do
        robot.place( 1, 1, 'EAST' )
        robot.left
      end

      it 'faces NORTH' do
        expect(robot.face).to be Direction.NORTH
      end
    end

    context 'turning left from SOUTH' do
      before do
        robot.place( 1, 1, 'SOUTH' )
        robot.left
      end

      it 'faces NORTH' do
        expect(robot.face).to be Direction.EAST
      end
    end

    context 'turning left from WEST' do
      before do
        robot.place( 1, 1, 'WEST' )
        robot.left
      end

      it 'faces SOUTH' do
        expect(robot.face).to be Direction.SOUTH
      end
    end

    context 'turning left from NORTH' do
      before do
        robot.place( 1, 1, 'NORTH' )
        robot.left
      end

      it 'faces WEST' do
        expect(robot.face).to be Direction.WEST
      end
    end
  end

  describe 'turning right' do
    context 'turning right from EAST' do
      before do
        robot.place( 1, 1, 'EAST' )
        robot.right
      end

      it 'faces SOUTH' do
        expect(robot.face).to be Direction.SOUTH
      end
    end

    context 'turning right from SOUTH' do
      before do
        robot.place( 1, 1, 'SOUTH' )
        robot.right
      end

      it 'faces WEST' do
        expect(robot.face).to be Direction.WEST
      end
    end

    context 'turning right from WEST' do
      before do
        robot.place( 1, 1, 'WEST' )
        robot.right
      end

      it 'faces NORTH' do
        expect(robot.face).to be Direction.NORTH
      end
    end

    context 'turning right from NORTH' do
      before do
        robot.place( 1, 1, 'NORTH' )
        robot.right
      end

      it 'faces EAST' do
        expect(robot.face).to be Direction.EAST
      end
    end
  end

  describe 'movements' do
    describe 'valid movements are possible' do
      context 'moving with EAST face' do
        before do
          robot.place(1,1, 'EAST')
          robot.move
        end
        it 'reports position 2,1,EAST' do
          expect(robot.report).to eq('2,1,EAST')
        end
      end

      context 'moving with SOUTH face' do
        before do
          robot.place(1,1, 'SOUTH')
          robot.move
        end
        it 'reports position 1,0,SOUTH' do
          expect(robot.report).to eq('1,0,EAST')
        end
      end

      context 'moving with WEST face' do
        before do
          robot.place(1,1, 'WEST')
          robot.move
        end
        it 'reports position 0,1,WEST' do
          expect(robot.report).to eq('0,1,WEST')
        end
      end

      context 'moving with NORTH face' do
        before do
          robot.place(1,1, 'NORTH')
          robot.move
        end
        it 'reports position 1,2,NORTH' do
          expect(robot.report).to eq('1,2,NORTH')
        end
      end
    end

    describe 'invalid movements are ignored' do

    end
  end
end