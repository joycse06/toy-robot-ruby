require 'spec_helper'

describe 'Simulator' do
  let(:simulator) { simulator = Simulator.new }

  describe 'placing' do
    it 'executes the place command correctly' do
      commands = ['PLACE 1,2,SOUTH']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('1,2,SOUTH')
    end
  end

  describe 'moving' do
    it 'can place and move robot' do
      commands = ['PLACE 1,2,SOUTH', 'MOVE']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('1,1,SOUTH')
    end
  end

  describe 'rotating' do
    it 'can place and rotate robot to LEFT' do
      commands = ['PLACE 1,2,SOUTH', 'LEFT']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('1,1,EAST')
    end

    it 'can place and rotate robot to RIGHT' do
      commands = ['PLACE 1,2,SOUTH', 'RIGHT']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('1,1,WEST')
    end
  end

  describe 'rotating and moving' do
    it 'can place and rotate robot to LEFT' do
      commands = ['PLACE 1,2,SOUTH', 'MOVE', 'MOVE', 'LEFT', 'MOVE']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('2,0,EAST')
    end

    it 'can place and rotate robot to RIGHT' do
      commands = ['PLACE 1,2,SOUTH', 'MOVE', 'MOVE', 'RIGHT', 'MOVE']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('0,0,WEST')
    end
  end

  describe 'ignores commands before a place' do
    it 'ignores all command before robot is PLACED' do
      commands = ['MOVE', 'MOVE', 'LEFT', 'MOVE']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('Ignoring command until robot is placed.')
    end
  end

  describe 'can handle multiple PLACE commands' do
    it 'can handle multiple valid PLACE commands' do
      commands = ['PLACE 1,2,SOUTH', 'PLACE 1,4,EAST', 'PLACE 2,2,WEST', 'PLACE 4,4,NORTH']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('4,4,NORTH')
    end

    it 'ignores all PLACE commands until a valid one' do
      commands = ['PLACE 1,2,INVALID', 'PLACE -5,4,EAST', 'PLACE 2,-7,WEST', 'PLACE 4,4,NORTH']
      commands.each { |command| simulator.execute(command) }
      expect(simulator.execute('REPORT')).to eq('4,4,NORTH')
    end
  end
end