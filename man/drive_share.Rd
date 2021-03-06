% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drive_share.R
\name{drive_share}
\alias{drive_share}
\title{Share files}
\usage{
drive_share(file, role = c("reader", "commenter", "writer", "owner",
  "organizer"), type = c("user", "group", "domain", "anyone"), ...,
  verbose = TRUE)
}
\arguments{
\item{file}{Something that identifies the file(s) of interest on your Google
Drive. Can be a character vector of names/paths, a character vector of file
ids or URLs marked with \code{\link{as_id}()}, or a \code{\link{dribble}}.}

\item{role}{Character. The role to grant. Must be one of:
\itemize{
\item organizer (applies only to Team Drives)
\item owner
\item writer
\item commenter
\item reader
}}

\item{type}{Character. Describes the grantee. Must be one of:
\itemize{
\item user
\item group
\item domain
\item anyone
}}

\item{...}{Name-value pairs to add to the API request. This is where you
provide additional information, such as the \code{emailAddress} (when grantee
\code{type} is \code{"group"} or \code{"user"}) or the \code{domain} (when grantee type is
\code{"domain"}). Read the API docs linked below for more details.}

\item{verbose}{Logical, indicating whether to print informative messages
(default \code{TRUE}).}
}
\value{
An object of class \code{\link{dribble}}, a tibble with one row per
  item.
}
\description{
Grant individuals or other groups access to files, including permission to
read, comment, or edit. The returned \code{\link{dribble}} will have extra columns,
\code{shared} and \code{permissions_resource}. Read more in \code{\link[=drive_reveal]{drive_reveal()}}.
}
\examples{
\dontrun{
## Upload a file to share
file <- drive_upload(
   system.file("DESCRIPTION"),
   name = "DESC-share-ex",
   type = "document"
)

## Let a specific person comment
file <- file \%>\%
  drive_share(
    role = "commenter",
    type = "user",
    emailAddress = "susan@example.com"
)

## Let a different specific person edit and customize the email notification
file <- file \%>\%
  drive_share(
    role = "writer",
    type = "user",
    emailAddress = "carol@example.com",
    emailMessage = "Would appreciate your feedback on this!"
)

## Let anyone read the file
file <- file \%>\%
  drive_share(role = "reader", type = "anyone")

## Clean up
drive_rm(file)
}
}
\seealso{
Wraps the \code{permissions.update} endpoint:
\itemize{
\item \url{https://developers.google.com/drive/v3/reference/permissions/create}
}
}
