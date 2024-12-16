shared_examples_for 'model with concerns' do |options|
  describe 'its is a child of' do
    Array(options[:parents]).each do |klass|
      it klass.name.to_s do
        expect(subject.class < klass).to be_truthy
      end
    end
  end

  describe 'it includes' do
    Array(options[:mixins]).each do |klass|
      it klass.name.to_s do
        expect(subject.is_a?(klass)).to be_truthy
      end
    end
  end

  describe 'it extends' do
    Array(options[:extensions]).each do |klass|
      it klass.name.to_s do
        expect(subject.class.is_a?(klass)).to be_truthy
      end
    end
  end
end
