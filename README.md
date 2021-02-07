# ProviHack_Database
Description of our database shell build up

#R documentation

#\name{HackWoman Database}

#\alias{HackWoman Database}

#\docType{data}

#\title{
%%   ~~ data name/kind ... ~~
}

#\description{
Creates a SQLite database and shows the dataframes used in our project.
}

#\usage{summary("database_name")}

#\format{
  There are 3 data frames with 5 observations each with 2 variables.
  \describe{
    \item{\code{"careers"}}{Contains the 5 careers in tech and their respectives id numbers}
    \item{\code{"learns"}}{Contains the 5 areas in professional and interpersonal development and their respectives id numbers}
    \item{\code{"instructs"}}{Contains the 5 areas in professional and interpersonal development and their respectives id numbers - Same as learns}
  }
}

#\details{
%%  ~~ If necessary, more details than the __description__ above ~~

#\format{
Additional information on packages: 
  \describe{
    \item{DBI defines an interface for communication between R and DBMS.}
    \item{Whereas, RSQLite allows through SQLite() and dbConnect() functions to connect to a SQLite database file.}
    \item{This is how a connection is established:}
    \item{\code{con <- dbConnect(RSQLite::SQLite(), dbname = "db_ff.db")}}
  }  
}

#\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}

#\references{
%%  ~~ possibly secondary sources and usages ~~
}

#\keyword{
database; SEMEAR
}

