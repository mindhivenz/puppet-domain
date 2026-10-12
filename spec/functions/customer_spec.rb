# frozen_string_literal: true

require 'spec_helper'

describe 'domain::customer' do
  context 'with a certname in the customer domain convention' do
    let(:node) { 'node.some-site.some-customer.lan' }

    it { is_expected.to run.with_params.and_return('some-customer') }
  end

  it_behaves_like 'undef outside the domain convention'
end
