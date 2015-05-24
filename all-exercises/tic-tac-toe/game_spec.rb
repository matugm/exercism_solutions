require_relative 'game'

describe TicTacToe do
  it 'starts a game with an empty board' do
    expect(subject.board).to eq [[], [], []]
  end

  it 'can fill one piece into the board' do
    subject.move(:cross, 0, 0)
    expect(subject.board[0][0]).to eq :cross
  end

  it 'returns false if there are not winning rows' do
    subject.move(:cross, 0, 0)
    subject.move(:circle, 0, 1)

    expect(subject.winner).to eq false
  end

  it 'can find a winning move in a horizontal row' do
    subject.move(:cross, 0, 0)
    subject.move(:cross, 0, 1)
    subject.move(:cross, 0, 2)

    expect(subject.winner).to eq true
  end

  it 'can find a winning move in a vertical row' do
    subject.move(:circle, 0, 0)
    subject.move(:circle, 1, 0)
    subject.move(:circle, 2, 0)

    expect(subject.winner).to eq true
  end
end
