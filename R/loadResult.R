#' @title Load the Result of a Single Job
#'
#' @description
#' Loads the result of a single job.
#'
#' @template id
#  @param read_result [\code{function}]. The method to read the result. Defaults to readRDS().
#  @param ... [\code{ANY}]. Additional arguments to be passed to \code{read_result}.
#' @template reg
#' @return [\code{ANY}]. The stored result.
#' @family Results
#' @export
loadResult = function(id, read_result=readRDS, ..., reg = getDefaultRegistry()) {
  assertRegistry(reg, sync = TRUE)
  id = convertId(reg, id)
  if (nrow(.findDone(reg, id)) == 0L)
    stopf("Job with id %i not terminated", id$job.id)
  fn = getResultFiles(reg, id)
  return(read_result(fn, ...))
}
