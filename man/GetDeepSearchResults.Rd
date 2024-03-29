% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetDeepSearchResults.R
\name{GetDeepSearchResults}
\alias{GetDeepSearchResults}
\title{Make request to Zillow API GetDeepSearchResults Web Service}
\usage{
GetDeepSearchResults(
  address = NULL,
  citystatezip = NULL,
  rentzestimate = FALSE,
  zws_id = getOption("ZillowR-zws_id"),
  url = "http://www.zillow.com/webservice/GetDeepSearchResults.htm"
)
}
\arguments{
\item{address}{The address of the property to search. Required.}

\item{citystatezip}{The city+state combination and/or ZIP code for which to
search. Required.}

\item{rentzestimate}{Return Rent Zestimate information if available (logical,
default: false).}

\item{zws_id}{The Zillow Web Service Identifier. Required.}

\item{url}{URL for the GetDeepSearchResults Web Service. Required.}
}
\value{
A named list with the following elements:
\describe{
\item{\strong{request}}{a list with the request parameters}
\item{\strong{message}}{a list of status code(s) and message(s)
returned by the API}
\item{\strong{response}}{an XMLNode with the API-specific response
values. At this time, no further coercion is performed, so you
may have to use functions from the \code{XML} package to extract
the desired output.}
}
}
\description{
The GetDeepSearchResults API finds a property for a specified address. The
result set returned contains the full address(s), zpid and Zestimate data
that is provided by the GetSearchResults API. Moreover, this API call also
gives rich property data like lot size, year built, bath/beds, last sale
details etc.
}
\examples{
\dontrun{
GetDeepSearchResults(address = '2114 Bigelow Ave', citystatezip = 'Seattle, WA')
GetDeepSearchResults(address = '2114 Bigelow Ave', citystatezip = 'Seattle, WA',
                     rentzestimate = TRUE)}
}
