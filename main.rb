# frozen_string_literal: true

require 'metainspector'
require 'pry'
require 'nokogiri'

require_relative 'models/estate'
require_relative 'models/page'

def main_page
  Page.new(website_url: 'https://www.zonaprop.com.ar/inmuebles-alquiler-rosario-1-habitacion-orden-publicado-descendente.html')
end

def main
  page = main_page
  # Retorna la primera página de propiedades en alquiler junto con sus links.
  # page.estates

  page.estates_links.each do |link|
    page.add(Estate.new(link))
  end

  page.mostrar_info
end

main

# Links para alquileres
# https://www.zonaprop.com.ar/inmuebles-alquiler-rosario-1-habitacion-orden-publicado-descendente.html
