# Propiedad en alquiler.
# TODO: parsear expensas.
class Estate
  attr_reader :price, :title, :expenses

  def initialize(estate_url)
    puts "Scrapeando #{estate_url}"
    @page = MetaInspector.new(estate_url)

    @title = @page.h1.first

    # Esto es horrible por razones obvias y necesita ser mejorado.
    script_parsed = @page.parsed.xpath('//script')[5].children.first.to_s
    @price = script_parsed.scan(/\$\s\d+.\d+/).first.gsub(/\$\s/, '').gsub(/\W/, '').to_i
    @expenses = expenses_parser(script_parsed)

    # script_parsed = @page.parsed.xpath('//script').first.children.first.to_s
    # @price = script_parsed.scan(/\$\s\d+/).first.gsub(/\$\s/, '').to_i
  end

  private

  def expenses_parser(script)
    list = script.scan(/'expenses':'\d+/)
    # Algunas no tienen expensas definidas.
    list.count.zero? ? 0 : list.gsub(/\D/, '').to_i
  end
end