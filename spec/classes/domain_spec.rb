# frozen_string_literal: true

require 'spec_helper'

describe 'domain' do

  context 'minimal' do
    let(:node) { 'node.some-site.some-customer.lan' }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('domain').with({ 'customer' => 'some-customer', 'site' => 'some-site' }) }
  end

  context 'all params' do
    let(:params) do
      {
        'customer' => 'some-customer',
        'site' => 'some-site',
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('domain').with({ 'customer' => 'some-customer', 'site' => 'some-site' }) }
  end

  context 'invalid domain' do
    let(:node) { 'wrong.parse' }

    it { is_expected.to contain_class('domain').with({ 'customer' => nil, 'site' => nil }) }
  end

end
