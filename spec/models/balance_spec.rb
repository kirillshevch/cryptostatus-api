describe Balance, type: :model do
  describe 'Scopes' do
    describe 'notifiable' do
      subject { described_class.notifiable }

      let(:user) { create(:user) }

      context '' do
        before { create(:balance, notified_at: nil, user: user) }

        it { is_expected.to be_present }
      end

      context '' do
        before { create(:balance, notified_at: 24.minutes.ago, user: user) }

        it { is_expected.to be_empty }
      end

      context '' do
        before { create(:balance, notified_at: 26.minutes.ago, user: user) }

        it { is_expected.to be_present }
      end
    end
  end
end
