require 'film'

describe Film do
  let(:film) { Film.new('Шрэк', 'Эндрю Адамсон', 2001) }
  let(:film2) { Film.new('Побег из Шоушенка', 'Фрэнк Дарабонт', 1994) }

  describe '#initialize' do
    it 'assigns film title' do
      expect(film.title).to eq 'Шрэк'
    end
    it 'assigns film director' do
      expect(film.director).to eq 'Эндрю Адамсон'
    end
    it 'assigns film release date' do
      expect(film.year).to eq 2001
    end
  end

  describe '#to_s' do
    it 'shows info about film' do
      expect(film.to_s).to eq 'Эндрю Адамсон — Шрэк (2001)'
      expect(film2.to_s).to eq 'Фрэнк Дарабонт — Побег из Шоушенка (1994)'
    end
  end
end
