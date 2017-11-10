uah = {
  priority: 100,
  iso_code: "UAH",
  name: "Ukrainian Hryvnia",
  symbol: "₴",
  alternate_symbols: [],
  subunit: "Kopiyka",
  subunit_to_unit: 100,
  symbol_first: false,
  html_entity: "грн",
  decimal_mark: ".",
  thousands_separator: ",",
  iso_numeric: "980",
  smallest_denomination: 1
}

Money::Currency.register(uah)
