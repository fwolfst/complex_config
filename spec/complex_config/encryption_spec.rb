require 'spec_helper'

RSpec.describe ComplexConfig::Encryption do
  let :secret do
    "\x1A8\x9E\xA8\xC2\x7F@@6\xB2W\a\x9A)\xCDw"
  end

  let :value do
    Marshal.dump('foobar')
  end

  let :enc do
    described_class.new secret
  end

  let :encrypted do
    "3uAULzmKjJGIWuFeEK+fORPAMPs=--BhH9oIkxoDiOlyLK--Ni5r+QtO9EYcDd7HlYd3Yw=="
  end

  it 'can encrypt' do
    expect(enc.encrypt(value)).to match /\A.+--.+--.+==\z/
  end

  it 'can decrypt' do
    expect(enc.decrypt(encrypted)).to eq value
  end
end
