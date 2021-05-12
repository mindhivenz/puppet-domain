# frozen_string_literal: true

require 'spec_helper'

describe 'domain::site' do

  context 'valid domain' do
    let(:node) { 'node.some-site.some-customer.lan' }

    it { is_expected.to run.and_return('some-site') }
  end

  context 'invalid domain' do
    let(:node) { 'wrong.parse' }

    it { is_expected.to run.and_return(nil) }
  end

end
