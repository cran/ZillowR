
#' Make request to Zillow API GetDeepSearchResults Web Service
#'
#' The GetDeepSearchResults API finds a property for a specified address. The
#' result set returned contains the full address(s), zpid and Zestimate data
#' that is provided by the GetSearchResults API. Moreover, this API call also
#' gives rich property data like lot size, year built, bath/beds, last sale
#' details etc.
#'
#' @param address The address of the property to search. Required.
#' @param citystatezip The city+state combination and/or ZIP code for which to
#'     search. Required.
#' @param rentzestimate Return Rent Zestimate information if available (logical,
#'     default: false).
#' @param zws_id The Zillow Web Service Identifier. Required.
#' @param url URL for the GetDeepSearchResults Web Service. Required.
#'
#' @return A named list with the following elements:
#'     \describe{
#'         \item{\strong{request}}{a list with the request parameters}
#'         \item{\strong{message}}{a list of status code(s) and message(s)
#'             returned by the API}
#'         \item{\strong{response}}{an XMLNode with the API-specific response
#'             values. At this time, no further coercion is performed, so you
#'             may have to use functions from the `XML` package to extract
#'             the desired output.}
#'     }
#'
#' @export
#' @importFrom RCurl getURL
#'
#' @examples
#' \dontrun{
#' GetDeepSearchResults(address = '2114 Bigelow Ave', citystatezip = 'Seattle, WA')
#' GetDeepSearchResults(address = '2114 Bigelow Ave', citystatezip = 'Seattle, WA',
#'                      rentzestimate = TRUE)}
GetDeepSearchResults <- function(
    address = NULL, citystatezip = NULL,
    rentzestimate = FALSE,
    zws_id = getOption('ZillowR-zws_id'),
    url = 'http://www.zillow.com/webservice/GetDeepSearchResults.htm'
) {
    validation_errors <- c(
        validate_arg(address, required = TRUE, class = 'character', length_min = 1, length_max = 1),
        validate_arg(citystatezip, required = TRUE, class = 'character', length_min = 1, length_max = 1),
        validate_arg(rentzestimate, inclusion = c(FALSE, TRUE), length_min = 1, length_max = 1),
        validate_arg(zws_id, required = TRUE, class = 'character', length_min = 1, length_max = 1),
        validate_arg(url, required = TRUE, class = 'character', length_min = 1, length_max = 1)
    )

    if (length(validation_errors) > 0) {
        stop(paste(validation_errors, collapse = '\n'))
    }

    request <- url_encode_request(url,
        'address' = address,
        'citystatezip' = citystatezip,
        'rentzestimate' = rentzestimate,
        'zws-id' = zws_id
    )

    response <- tryCatch(
        RCurl::getURL(request),
        error = function(e) {stop(sprintf("Zillow API call with request '%s' failed with %s", request, e))}
    )

    return(preprocess_response(response))
}
