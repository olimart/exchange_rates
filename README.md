# Exchange Rates

[![Build Status](https://semaphoreci.com/api/v1/olimart/exchange_rates/branches/master/badge.svg)](https://semaphoreci.com/olimart/exchange_rates)

## Getting started

1. copy and rename `config/database.yml.sample`
2. copy and rename `config/application.yml.sample`
3. Run `rails bs` to bootstrap database
4. Seed database `rake rates:update_from_open_exchange_rates`
5. start server `foreman start`
