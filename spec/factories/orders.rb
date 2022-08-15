FactoryBot.define do
  factory :order do
    post_code      {'100-0000'}
    prefecture_id  {2}
    municipalitie  {'テスト区'}
    address        {'テスト市１−１−１'}
    building       {'testビル101'}
    telephone      {9012345678}

  end
end
