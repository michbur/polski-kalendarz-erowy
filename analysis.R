library(calendR)
library(ggplot2)

months_pl <- c("Styczeń", "Luty", "Marzec", "Kwiecień", "Maj",
               "Czerwiec", "Lipiec", "Sierpień", "Wrzesień",
               "Październik", "Listopad", "Grudzień")

df <- data.frame(m = c(12, 1L:12), y = c(2020, rep(2021, 12)))

plots <- lapply(1L:nrow(df), function(i) {
  calendR(start = "M", year = df[i, "y"],  month = df[i, "m"]) +
    ggtitle(paste0(months_pl[df[i, "m"]], " ", df[i, "y"]))
})

pdf("kalendarz.pdf", onefile = TRUE, height = 8.3, width = 11.7)
for(i in plots) print(i)
dev.off()

