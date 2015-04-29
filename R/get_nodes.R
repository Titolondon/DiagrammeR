#' Get vector of node IDs
#'
#' Provides information on the node IDs from one or several node data frames, edge data frames, or graph objects.
#'
#' @param ... a collection of node data frames, edge data frames, or graph objects.
#' @export get_nodes

get_nodes <- function(...){

  objects <- list(...)

  for (i in 1:length(objects)){

    if (i == 1) node_ID <- vector(mode = "character")

    object <- objects[[i]]

    if (class(object) == "gv_graph"){

      object_type <- "gv_graph"
    }

    if (class(object) == "data.frame"){

      if (any(c("nodes", "node", "node_ID") %in% colnames(object))){

        object_type <- "node_df"
      }

      if (any(c("edge_from", "edge_to", "from", "to") %in% colnames(object))){

        object_type <- "edge_df"
      }
    }

    if (object_type == "gv_graph"){

      object <- object$nodes_df

      if ("node" %in% colnames(object)){
        nodes_column <- which("node" %in% colnames(object))
      } else if ("nodes" %in% colnames(object)){
        nodes_column <- which("nodes" %in% colnames(object))
      } else if ("node_id" %in% colnames(object)){
        nodes_column <- which("node_id" %in% colnames(object))
      } else {
        stop("There is no column with node ID information.")
      }

      node_ID <- c(node_ID, object[,nodes_column])
    }

    if (object_type == "node_df"){

      if ("node" %in% colnames(object)){
        nodes_column <- which("node" %in% colnames(object))
      } else if ("nodes" %in% colnames(object)){
        nodes_column <- which("nodes" %in% colnames(object))
      } else if ("node_id" %in% colnames(object)){
        nodes_column <- which("node_id" %in% colnames(object))
      } else {
        stop("There is no column with node ID information.")
      }

      node_ID <- c(node_ID, object[,nodes_column])
    }

    if (object_type == "edge_df"){

      both_from_to_columns <- all(c(any(c("edge_from", "from") %in%
                                          colnames(object))),
                                  any(c("edge_to", "to") %in%
                                        colnames(object)))

      if (exists("both_from_to_columns")){

        if (both_from_to_columns == TRUE){

          from_column <- which(colnames(object) %in% c("edge_from", "from"))[1]

          to_column <- which(colnames(object) %in% c("edge_to", "to"))[1]
        }
      }

      node_ID <- c(node_ID, unique(c(object[,from_column],
                                     object[,to_column])))
    }
  }

  all_ID_unique <- ifelse(anyDuplicated(node_ID) == 0, TRUE, FALSE)

  if (all_ID_unique == TRUE){
    return(node_ID)
  }
}