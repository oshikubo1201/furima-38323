FactoryBot.define do
  factory :order do
    post_code      {'100-0000'}
    prefecture_id  {2}
    municipalitie  {'テスト区'}
    address        {'テスト市１−１−１'}
    building       {'testビル101'}
    telephone      {9012345678}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
