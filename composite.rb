# frozen_string_literal: true

class Component
  def add(_component)
    raise 'Tiene que ser implementado en las subclases'
  end

  def mostrar_info
    raise 'Tiene que ser implementado en las subclases'
  end
end
