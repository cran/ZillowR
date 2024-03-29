% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zillow_web_service_id.R
\name{zillow_web_service_id}
\alias{zillow_web_service_id}
\alias{get_zillow_web_service_id}
\alias{set_zillow_web_service_id}
\title{Get/Set Zillow Web Service ID}
\usage{
get_zillow_web_service_id()

set_zillow_web_service_id(x)
}
\arguments{
\item{x}{A character string of length 1 with your Zillow Web Service ID.}
}
\value{
\code{get_zillow_web_service_id} returns a character value with the current
'ZillowR-zws_id' option, or \code{NULL} if unset.

\code{set_zillow_web_service_id} invisibly returns \code{NULL}.
}
\description{
Convenience functions to set your Zillow Web Service ID as a global option
}
\details{
Each subscriber to Zillow Web Services is uniquely identified by an ID
sequence, and every request to Web Services requires this ID. You may pass
your ID to each ZillowR function explicitly, but by default each function
uses the value saved in the global 'ZillowR-zws_id' option. The
\code{get_zillow_web_service_id} and \code{set_zillow_web_service_id}
functions make it easy to manipulate this option.

Visit the following URL to register for your own Zillow Web Service ID: \cr
http://www.zillow.com/webservice/Registration.htm
}
\examples{
set_zillow_web_service_id('ZWSID')
get_zillow_web_service_id()

}
