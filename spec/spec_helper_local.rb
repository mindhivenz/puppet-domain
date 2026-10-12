# frozen_string_literal: true

shared_examples 'undef outside the domain convention' do
  {
    'a domain outside the .lan convention' => 'node.some-site.some-customer.com',
    'too many labels in the domain' => 'node.line.some-site.some-customer.lan',
    'too few labels in the domain' => 'node.some-customer.lan',
    'a certname that has no domain' => 'standalone',
  }.each do |description, certname|
    context "with #{description}" do
      let(:node) { certname }

      it { is_expected.to run.with_params.and_return(nil) }
    end
  end

  context 'when called with an argument' do
    it { is_expected.to run.with_params('x').and_raise_error(ArgumentError) }
  end
end
