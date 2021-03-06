require 'rails_helper'
require 'terminal'

RSpec.describe TermApp::Terminal, type: :termapp do
  subject(:term) { silence_warnings { described_class.new } }
  after(:example) do
    term.terminate
  end

  it 'responds to forwarded methods' do
    expect(term).to respond_to(:erase,
                               :noecho,
                               :echo,
                               :beep,
                               :terminate,
                               :refresh,
                               :move)
  end

  describe '.color_<color>' do
    it { is_expected.to respond_to(*described_class.const_get(:COLOR_SYMBOLS)) }
  end
end
