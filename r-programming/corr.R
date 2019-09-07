corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.names = TRUE)
    res_vector = numeric()
    for (i in 1:length(files)) {
        df <- read.csv(files[i])
        nobs <- sum(!is.na(df$nitrate) & !is.na(df$sulfate))
        if (nobs > threshold) {
            res_vector <- c(res_vector, cor(df$sulfate, df$nitrate, use = 'complete.obs'))
        }
    }
    res_vector
}