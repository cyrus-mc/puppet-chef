require 'spec_helper'
describe 'chef' do

  context 'with defaults for all parameters' do
    it { should contain_class('chef') }
  end
end
