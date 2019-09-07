complete <- function(directory, id=1:332) {
    files <- list.files(directory, full.names = TRUE)
    res_vector = integer()
    for (i in id) {
        df <- read.csv(files[i])
        res_vector = c(res_vector, sum(!is.na(df$nitrate) & !is.na(df$sulfate)))
    }
    data.frame(id=id, nobs=res_vector)
}