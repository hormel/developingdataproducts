shinyUI(pageWithSidebar(
  headerPanel("Stock price forecast"),
  sidebarPanel(
    h5 ("This app will, given a stock ticker, provide a confidence interval of future stock price based on analysis of prior stock price.  To use, enter the stock ticker below, and a date range to use as input for calculating the confidence interval.  The prediction and confidence interval is based on mean daily returns calculated for the sample period."),
    h5 ("The app pulls data from Yahoo Finance, so will only work with tickers available there (for example, try AAPL, GOOG, FB, or TWTR).  Also, given the limited time, there's minimal erro checking, so please enter reasonable data."),
    textInput('ticker', 'Ticker: ', 'AAPL'),
    actionButton ("update", "Update data (reload from Yahoo Finance)"),
    h5 (""),
    dateInput ('startDate', 'Start Date: ', value = Sys.Date () - 30),
    dateInput ('endDate', 'End Date: ', value = Sys.Date () - 1),
    numericInput ('forecastDays', 'Forecast period (days): ', 30, min = 1, max = 90, step = 1),
    numericInput ('confidence', 'Confidence Interval (%):', 95, min = 0, max = 99, step = 1),
    h6 ("\n\nBuilt for Johns Hopkins / Coursera course Developing Data Products, June 2015")
  ),
  mainPanel(
    plotOutput('stockForecast')
  )
))
