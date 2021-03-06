% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_edges_from_df.R
\name{add_edges_from_df}
\alias{add_edges_from_df}
\title{Add edges and attributes from a data frame}
\usage{
add_edges_from_df(graph, df, from_col, from_attr, to_col, to_attr,
  set_rel = NULL, select_cols = NULL, drop_cols = NULL,
  rename_attrs = NULL, rel_col = NULL)
}
\arguments{
\item{graph}{a graph object of class \code{dgr_graph} that is created
using \code{create_graph}.}

\item{df}{the name of the data frame object.}

\item{from_col}{the name of the data frame column from which edges originate.}

\item{from_attr}{the mapping of \code{from_col} values to attributes of
the graph's nodes.}

\item{to_col}{to_col the name of the data frame column to which edges
terminate.}

\item{to_attr}{the mapping of \code{to_col} values to attributes of
the graph's nodes.}

\item{set_rel}{an optional string to apply a \code{rel} attribute to
all edges created from the data frame's records.}

\item{select_cols}{an optional character vector for specifying which
columns in the data frame should be imported as edge attributes.}

\item{drop_cols}{an optional character vector for dropping columns
from the incoming data.}

\item{rename_attrs}{an optional character vector for renaming edge
attributes.}

\item{rel_col}{an option to apply a column of data in the data frame as
\code{rel} attribute values.}
}
\value{
a graph object of class \code{dgr_graph}.
}
\description{
Add edges and their attributes to an existing graph object
from data in a data frame.
}

