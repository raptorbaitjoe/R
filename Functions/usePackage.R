usePackage <- function(p)
{
  if (!is.element(p, installed.packages()[,1]))
     install.packsges(p, dep = TRUE)
    require(p, character.only = TRUE)
}

usePackage("dplyr")
