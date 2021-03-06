% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drive_mv.R
\name{drive_mv}
\alias{drive_mv}
\title{Move a Drive file.}
\usage{
drive_mv(file, path = NULL, name = NULL, verbose = TRUE)
}
\arguments{
\item{file}{Something that identifies the file of interest on your Google
Drive. Can be a name or path, a file id or URL marked with
\code{\link{as_id}()}, or a \code{\link{dribble}}.}

\item{path}{Specifies target destination for the new file on Google
Drive. Can be an actual path (character), a file id marked with
\code{\link{as_id}()}, or a \code{\link{dribble}}. If specified as an
actual path, it is best to explicitly indicate if it's a folder by
including a trailing slash, since it cannot always be worked out from the
context of the call. Defaults to current name.}

\item{name}{Character, new file name if not specified as part of
\code{path}. This will force \code{path} to be treated as a folder, even if
it is character and lacks a trailing slash. Defaults to current name.}

\item{verbose}{Logical, indicating whether to print informative messages
(default \code{TRUE}).}
}
\value{
An object of class \code{\link{dribble}}, a tibble with one row per
  item.
}
\description{
Move a Drive file to a different folder, give it a different name, or both.
Note that folders on Google Drive are not like folders on your local
filesystem. They are more like a label, which implies that a Drive file can
have multiple folders as direct parent! However, most people still use and
think of them like "regular" folders. When we say "move a Drive file", it
actually means: "add a new folder to this file's parents and remove the old
one".
}
\examples{
\dontrun{
## create a file to move
file <- drive_upload(system.file("DESCRIPTION"), "DESC-mv")

## rename it, but leave in current folder (root folder, in this case)
file <- drive_mv(file, "DESC-mv-renamed")

## create a folder to move the file into
folder <- drive_mkdir("mv-folder")

## move the file and rename it again,
## specify destination as a dribble
file <- drive_mv(file, path = folder, name = "DESC-mv-re-renamed")

## verify renamed file is now in the folder
drive_ls(folder)

## move the file back to root folder
file <- drive_mv(file, "~/")

## move it again
## specify destination as path with trailing slash
## to ensure we get a move vs. renaming it to "mv-folder"
file <- drive_mv(file, "mv-folder/")

## Clean up
drive_rm(file, folder)
}
}
