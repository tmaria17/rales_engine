# Rales Engine
First solo project for Module 3 of Turing's Back-End Engineering program. This project uses Rails and ActiveRecord to to build a JSON API that exposes sales engine data.
<a href="https://codeclimate.com/github/tmaria17/rales_engine/maintainability"><img src="https://api.codeclimate.com/v1/badges/7a1a39189fcfeb4f7928/maintainability" /></a>

# Prerequisites/ Dependencies
 This project assumes you have installed: 
 * Ruby 2.4.1
 * Rails 5.2.1
 * Byebug
 * Capybara
 * Pry
 * Shoulda-Matchers
 * SimpleCov
 * fast_jasonapi


## Installing

1. Clone down the repo:

` git clone git@github.com:tmaria17/rales_engine.git`

2. Run:

`bundle install`

`bundle update`

3. Setup the database:

 `rake db:setup`
 
 4. Import CSV Data:
  `rake import:all`



## Running the tests
To run the full testing suite, run `rspec` from the command line.

## Endpoints

To make API requests, after setup, boot up a local server with rails s, then in your browser, after localhost:3000, try one of the following:

GET `/api/v1/merchants/:id/items` returns a collection of items associated with that merchant

GET `/api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders
Invoices

GET `/api/v1/invoices/:id/transactions` returns a collection of associated transactions

GET `/api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items

GET `/api/v1/invoices/:id/items` returns a collection of associated items

GET `/api/v1/invoices/:id/customer` returns the associated customer

GET `/api/v1/invoices/:id/merchant` returns the associated merchant

Invoice Items

GET `/api/v1/invoice_items/:id/invoice` returns the associated invoice

GET `/api/v1/invoice_items/:id/item` returns the associated item

Items
GET `/api/v1/items/:id/invoice_items` returns a collection of associated invoice items

GET `/api/v1/items/:id/merchant` returns the associated merchant

Transactions
GET `/api/v1/transactions/:id/invoice` returns the associated invoice

Customers

GET `/api/v1/customers/:id/invoices` returns a collection of associated invoices

GET `/api/v1/customers/:id/transactions` returns a collection of associated transactions

Business Intelligence Endpoints

All Merchants
GET `/api/v1/merchants/most_revenue?quantity=x`returns the top x merchants ranked by total revenue

GET `/api/v1/merchants/most_items?quantity=x`returns the top x merchants ranked by total number of items sold

GET `/api/v1/merchants/revenue?date=x `returns the total revenue for date x across all merchants


Single Merchant
GET `/api/v1/merchants/:id/revenue` returns the total revenue for that merchant across successful transactions

GET `/api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date x

GET `/api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.


Items

GET `/api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated

GET `/api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold

GET `/api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

Customers

GET `/api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions




## Contributors

[Maria Torres](https://github.com/tmaria17)
