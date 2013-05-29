Purpose
-------
RubyStocks is an investment research app that ultimately aims to eliminate the need for expensive services like Bloomberg and Capital IQ, which can cost between $1,000 - $2,000 per month.  Most of the information that an investment analyst needs exists in the public domain, like the SEC's EDGAR database.  This app will allow the user to call upon a company, either by name or by ticker, and retrieve specific financials, ownership or insider trading data on that company.


Project Status
--------------

[![Build Status](https://github.com/virajparikh/Ruby_capstone_investment_research.png)](https://github.com/virajparikh/Ruby_capstone_investment_research)

Currently the user can list, create or delete stocks portfolios, and add/delete stock tickers to the various portfolios created.

Ultimately, the app will extract financial data like inventory, revenues, or operating cash flow from the SEC Edgar database.  Input company ticker, financial metric and time period, and the app will return the data that is sought.  The sources of finacial data will be either Form 10-K or 10-Q - mandatory annual and quarterly filings by publicly traded companies.  Other retrievable data points include Form 13-D, which reveals greater than 5% ownership in a company, and Form 144, which reveals insider (C-level officers and/or Directors) buys and sells.


Features and Instructions
---------------------------
Currently supported commands are: ruby rubystocks...
* list
* add portfolio_name
* remove portfolio_name
* edit portfolio_name
* view portfolio_name  


Bugs
----
For sure.


About Author
------------
Viraj Parikh is an investment research analyst and portfolio manager for most of his professional career.  He has worked with the most widely used data services on the market, including Bloomberg, Capital IQ and Factset.  He has also made extensive use of free web sites, including Yahoo Finance, Google Finance and Finviz.  These experiences have shaped his vision for this app.