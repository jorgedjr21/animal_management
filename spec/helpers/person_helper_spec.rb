require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PersonHelper. For example:
#
# describe PersonHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PersonHelper, type: :helper do
  let(:person) { create(:person) }

  describe '#person_table_header' do
    context 'when person exists' do
      it { expect(helper.person_table_header(person)).to eq(%w[name document birthdate]) }
    end

    context 'when person not exists' do
      it { expect(helper.person_table_header('')).to eq([]) }
    end
  end
end
