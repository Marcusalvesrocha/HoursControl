class TimePointing < ApplicationRecord
  belongs_to :employee

  enum shift: { Manha: 0, Tarde: 1 }
  enum kind: { Entrada: 0, Saida: 1 }
end
