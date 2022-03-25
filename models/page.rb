# frozen_string_literal: true

require_relative '../composite'

# Página web que enlista propiedades en alquiler.
# TODO: solo scrapea la primera página de resultados. Replicar para las demás.
class Page < Component
  attr_reader :links, :estates_links, :estates_titles, :page

  def initialize(params)
    @page = MetaInspector.new(params[:website_url])
    @links = page.links.internal
    @estates_links = @links.select { |l| l.include? '/propiedades/' }
    @estates_titles = page.h2

    @estates = []

    # Cada h2 es el título de cada link de alquiler disponible.
    raise StandardError unless @estates_links.count == @estates_titles.count
  end

  def add(component)
    @estates << component
  end

  def mostrar_info
    @estates.each(&:mostrar_info)
  end

  def estates
    @estates_titles.zip(@estates_links).each do |tit, lin|
      puts "#{tit}\n#{lin}"
    end
  end
end
