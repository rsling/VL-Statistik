set.seed(1294)

# Mode

smode <- c(rep("AP", 3), rep("CP", 2), rep("VP", 4), rep("NP", 6), rep("IP", 1), rep("PP", 2))
pdf("mode.pdf")
barplot(table(smode)[order(table(smode), decreasing = T)], col = c("navy", rep("gray", 5)), ylab = "Anzahl Belege", xlab = "Phrasentyp", border = "white", cex = 1.5, cex.axis = 1.5, cex.lab = 1.5)
dev.off()

# Median

xlit <- factor(sample(c(rep("s. schlecht", 3), rep("schlecht", 4), rep("neutral", 1), rep("gut", 2), rep("s. gut", 5))),
               levels = c("s. schlecht", "schlecht", "neutral", "gut", "s. gut"))
pdf("median.pdf")
bp <- barplot(table(xlit), col = rep("gray", 5), ylab = "Anzahl Urteile", xlab = "Akzeptabilität", border = "white", cex = 1.25, cex.axis = 1.5, cex.lab = 1.5)
lines(c(bp[3], bp[3]), c(0, 4.9), lwd = 8, col = "navy")
dev.off()

# Mean
pdf("mean.pdf")
smean <- c(rep(1, 2), rep(2, 3), rep(3, 5), rep(4, 4), rep(5, 6), rep(6, 3), rep(7, 3), rep(8, 0), rep(9, 1))
hist(smean, breaks = 10, xlim = c(0,10), ylab = "Anzahl NPs", xlab = "Länge der NP in Wörtern", border = "white", cex = 1.5, cex.axis = 1.5, cex.lab = 1.5, main ="")
lines(c(mean(smean), mean(smean)), c(0, 6), lwd = 8, col = "navy")
dev.off()

# Median in detail

cols <- c("darkorange3", "darkgoldenrod2", "aquamarine4", "cornflowerblue", "darkorchid4")

x <- sample(c(rep(1, 3), rep(2, 4), rep(3, 1), rep(4, 2), rep(5, 5)))

par(mar = c(5.1, 4.1, 4.1, 2.1))

pdf("median1a.pdf")
plot(x, col=cols[x], pch = 19, cex = 3, bty = "n", axes = F, xlab = "", ylab ="", main = "Stichprobe")
axis(2, tick = F, at = 1:5, labels = c("sehr schlecht", "schlecht", "neutral", "gut", "sehr gut"))
dev.off()

x <- sort(x)

pdf("median1b.pdf")
plot(x, col=cols[x], pch = 19, cex = 3, bty = "n", axes = F, xlab = "", ylab ="", main = "Sortierte Stichprobe (n=15)", ylim = c(1, 6))
axis(2, tick = F, at = 1:5, labels = c("sehr schlecht", "schlecht", "neutral", "gut", "sehr gut"))
arrows(8, 5.5, 8, 3.25, lwd = 10, col = "navy")
text(3, 3.25, "Median", cex = 1.5, col = "navy")
arrows(7, 3, 1, 3, lwd = 10, col = "navy")
lines(c(1, 7), c(5.5, 5.5), lwd = 10, col = "darkgray")
text(3, 5.75, "7 Datenpunkte", cex = 1.5, col = "darkgray")
lines(c(9, 15), c(5.5, 5.5), lwd = 10, col = "darkgray")
text(13, 5.75, "7 Datenpunkte", cex = 1.5, col = "darkgray")
dev.off()

# Second example.

pdf("median2.pdf")
x <- sample(c(rep(1, 4), rep(2, 4), rep(3, 2), rep(4, 2), rep(5, 1)))
x <- sort(x)
plot(x, col=cols[x], pch = 19, cex = 3, bty = "n", axes = F, xlab = "", ylab ="", main = "Sortierte Stichprobe (n=13)", ylim = c(1, 6))
axis(2, tick = F, at = 1:5, labels = c("very bad", "bad", "neutral", "good", "very good"))
arrows(7, 5.5, 7, 2.25, lwd = 10, col = "navy")
text(2.75, 2.25, "Median", cex = 1.5, col = "navy")
arrows(4, 2, 1, 2, lwd = 10, col = "navy")
lines(c(1, 6), c(5.5, 5.5), lwd = 10, col = "darkgray")
text(3, 5.75, "6 Datenpunkte", cex = 1.5, col = "darkgray")
lines(c(8, 13), c(5.5, 5.5), lwd = 10, col = "darkgray")
text(11, 5.75, "6 Datenpunkte", cex = 1.5, col = "darkgray")
dev.off()



# Quartiles and samples with different empirical distributions.

pdf("fourdists.pdf")
par(mfrow = c(2, 2))

x1 <- c(rep(1, 3), rep(2, 2), rep(3, 4), rep(4, 2), rep(5, 3), rep(6, 3), rep(7, 1))
barplot(table(x1), ylim = c(0, 20), border = "white")
abline(v = mean(x1), lwd = 2, lty = 1, col = cols[1])
abline(v = median(x1), lwd = 2, lty = 1, col = cols[2])
legend("topright", bty = "n", lty = c(1, 1), col = cols, legend = c(paste0("Mittel = ", round(mean(x1), 2)), paste0("Median = ", round(median(x1), 2))), lwd = 2)
sum(x1)
length(x1)
mean(x1)

x2 <- c(rep(1, 0), rep(2, 0), rep(3, 11), rep(4, 4), rep(5, 1), rep(6, 1), rep(7, 1))
barplot(table(factor(x2, levels = 1:7)), ylim = c(0, 20), border = "white")
abline(v = mean(x2), lwd = 2, lty = 1, col = cols[1])
abline(v = median(x2), lwd = 2, lty = 1, col = cols[2])
legend("topright", bty = "n", lty = c(1, 1), col = cols, legend = c(paste0("Mittel = ", round(mean(x2), 2)), paste0("Median = ", round(median(x2), 2))), lwd = 2)
sum(x2)
length(x2)
mean(x2)

x3 <- c(rep(1, 7), rep(2, 2), rep(3, 1), rep(4, 0), rep(5, 1), rep(6, 1), rep(7, 6))
barplot(table(factor(x3, levels = 1:7)), ylim = c(0, 20), border = "white")
abline(v = mean(x3), lwd = 2, lty = 1, col = cols[1])
abline(v = median(x3), lwd = 2, lty = 1, col = cols[2])
legend("topright", bty = "n", lty = c(1, 1), col = cols, legend = c(paste0("Mittel = ", round(mean(x3), 2)), paste0("Median = ", round(median(x3), 2))), lwd = 2)
sum(x3)
length(x3)
mean(x3)

x4 <- c(rep(1, 1), rep(2, 1), rep(3, 0), rep(4, 16), rep(5, 0), rep(6, 0), rep(7, 0))
barplot(table(factor(x4, level = 1:7)), border = "white")
abline(v = mean(x4), lwd = 2, lty = 1, col = cols[1])
abline(v = median(x4), lwd = 2, lty = 1, col = cols[2])
legend("topright", bty = "n", lty = c(1, 1), col = cols, legend = c(paste0("Mittel = ", round(mean(x4), 2)), paste0("Median = ", round(median(x4), 2))), lwd = 2)
sum(x4)
length(x4)
mean(x4)

dev.off()
par(mfrow = c(1, 1))




qdraw <- function(x) {
  .s <- summary(x)
  .l <- length(x)/4
  print(.l)
  lines(x = c(0, 1, 1), y = c(.s[1], .s[1], 0), col = cols[1], lwd = 2, lty = 1)
  text(1.5, 0.25, round(.s[1], 1),  col = cols[1])
  lines(x = c(0, .l, .l), y = c(.s[2], .s[2], 0), col = cols[2], lwd = 2, lty = 1)
  text(1+.l, 0.25, round(.s[2], 1), col = cols[2])
  lines(x = c(0, .l*2, .l*2), y = c(.s[3], .s[3], 0), col = cols[3], lwd = 2, lty = 1)
  text(1+(.l*2), 0.25, round(.s[3], 1), col = cols[3])
  lines(x = c(0, .l*3, .l*3), y = c(.s[5], .s[5], 0), col = cols[4], lwd = 2, lty = 1)
  text(1+(.l*3), 0.25, round(.s[5], 1), col = cols[4])
  lines(x = c(0, .l*4, .l*4), y = c(.s[6], .s[6], 0), col = cols[5], lwd = 2, lty = 1)
  text(1+(.l*4), 0.25, round(.s[6], 1), col = cols[5])
#  lines(c(1, seq(.l, .l*4, .l)), .s[-4], lty = 1, col = "darkorange", lwd = 2)
}

# The four samples

pdf("foursamples.pdf")
par(mar = c(2, 2, 1, 1))
par(mfrow = c(2, 2))
plot(x1, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
plot(x2, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
plot(x3, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
plot(x4, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
dev.off()
par(mfrow = c(1, 1))
par(mar = c(5.1, 4.1, 4.1, 2.1))



# Quartile

pdf("fourquartiles.pdf")
par(mar = c(5.1, 4.1, 4.1, 2.1))
m <- matrix(c(1,2,3,4,5,5), nrow = 3, ncol = 2, byrow = TRUE)
layout(mat = m, heights = c(0.45, 0.45, 0.1))
plot(x1, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
qdraw(x1)
plot(x2, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
qdraw(x2)
plot(x3, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
qdraw(x3)
plot(x4, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
qdraw(x4)
par(mar=c(0,0,0,0))
plot(1, type = "n", axes=FALSE, xlab="", ylab="")
legend("top", inset = 0, lty = 1, legend = c("Q0 (Min)", "Q1", "Q2 (Med)", "Q3", "Q4 (Max)"), lwd = 2, col = cols, horiz = T, bty = "n")
dev.off()

# Boxplot

par(mar = c(5.1, 4.1, 4.1, 2.1))

pdf("fourbox.pdf")
par(mar = c(2, 2, 1, 1))
par(mfrow = c(2, 2))
boxplot(x1, frame = F, ylim = c(0, 7))
boxplot(x2, frame = F, ylim = c(0, 7))
boxplot(x3, frame = F, ylim = c(0, 7))
boxplot(x4, frame = F, ylim = c(0, 7))
dev.off()

par(mfrow = c(1, 1))
par(mar = c(5.1, 4.1, 4.1, 2.1))


# Vioin plot
library("vioplot")

pdf("fourviolins.pdf")
par(mar = c(2, 2, 1, 1))
par(mfrow = c(2, 2))
vioplot(x1, ylim = c(1, 7), col = "cadetblue3", rectCol = "navy", lineCol = "darkgreen", colMed = "darkorange", border = "cadetblue3", pchMed = 16,  plotCentre = "points", axes = F, xaxt = "n")
vioplot(x2, ylim = c(1, 7), col = "cadetblue3", rectCol = "navy", lineCol = "darkgreen", colMed = "darkorange", border = "cadetblue3", pchMed = 16,  plotCentre = "points", axes = F, xaxt = "n")
vioplot(x3, ylim = c(1, 7), col = "cadetblue3", rectCol = "navy", lineCol = "darkgreen", colMed = "darkorange", border = "cadetblue3", pchMed = 16,  plotCentre = "points", axes = F, xaxt = "n")
vioplot(x4, ylim = c(1, 7), col = "cadetblue3", rectCol = "navy", lineCol = "darkgreen", colMed = "darkorange", border = "cadetblue3", pchMed = 16,  plotCentre = "points", axes = F, xaxt = "n")
dev.off()

# Variance

# The four samples

varplot <- function(x) {
  plot(x, ylim = c(0, 7), xlim = c(0, 20), pch = 20, cex = 1, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
  .m <- mean(x)
  for (.i in 1:18) {
    lines(c(.i, .i), c(.m, x[.i]), lty = 3, col = rep("darkred", 18), lwd = 2)
  }
  points(x, pch = 20, cex = 3, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
  lines(x = c(1, 18), y = rep(.m, 2), col = "cadetblue", lwd = 3)
}

pdf("fourvariances.pdf")
par(mar = c(2, 2, 1, 1))
par(mfrow = c(2, 2))
varplot(x1)
varplot(x2)
varplot(x3)
varplot(x4)
dev.off()
par(mfrow = c(1, 1))
par(mar = c(5.1, 4.1, 4.1, 2.1))




# Standard deviations

splot <- function(x) {
  .d <- density(x)
  .m <- mean(x)
  .s <- sd(x)
  .l <- .m - .s
  .h <- .m + .s
  print(.m)
  print(.l)
  print(.h)
  .i <- which.min(abs(.d$x-.m))
  .l <- which.min(abs(.d$x-.l))
  .h <- which.min(abs(.d$x-.h))
  print(.l)
  print(.h)
  lines(x = c(.d$x[.i], .d$x[.i]), y = c(0, .d$y[.i]), lwd = 2)
  lines(x = c(.d$x[.l], .d$x[.l]), y = c(0, .d$y[.l]), lwd = 2, col = "grey", lty = 2)
  lines(x = c(.d$x[.h], .d$x[.h]), y = c(0, .d$y[.h]), lwd = 2, col = "grey", lty = 2)
}

pdf("stdevs.pdf")
par(mfrow = c(2, 2))
plot(density(x1), bty = "n", yaxt = "n", ylab = "", sub = "", xlab = "", main = paste0("sd = ", round(sd(x1), 2)), xlim = c(-1, 8))
splot(x1)
plot(density(x2), bty = "n", yaxt = "n", ylab = "", sub = "", xlab = "", main = paste0("sd = ", round(sd(x2), 2)), xlim = c(-1, 8))
splot(x2)
plot(density(x3), bty = "n", yaxt = "n", ylab = "", sub = "", xlab = "", main = paste0("sd = ", round(sd(x3), 2)), xlim = c(-1, 8))
splot(x3)
plot(density(x4), bty = "n", yaxt = "n", ylab = "", sub = "", xlab = "", main = paste0("sd = ", round(sd(x4), 2)), xlim = c(-1, 8))
splot(x4)
dev.off()
par(mfrow = c(1, 1))



# Visualise z scores

zplot <- function(x) {
  .m <- mean(x)
  .s <- sd(x)
  .z <- (x-.m)/.s
    plot(x, ylim = c(0, 8), xlim = c(0, 20), pch = 20, cex = 1, col = rep("darkgray", 18), bty = "n", xlab = "", ylab = "",
       main = "", xaxt = "n")

  # Now plot sd breaks
  .j <- .m + .s
  while (.j <= 7) {
    lines(c(1, 18), rep(.j, 2), col = "lightgray", lwd = 1, lty = 1)
    .j <- .j + .s
  }
  .j <- .m - .s
  while (.j >= 0) {
    lines(c(1, 18), rep(.j, 2), col = "lightgray", lwd = 1, lty =1)
    .j <- .j - .s
  }

  # Plot variance components
  for (.i in 1:18) {
    lines(c(.i, .i), c(.m, x[.i]), lty = 3, col = rep("lightgray", 18), lwd = 2)
    print(x[.i])
    print(.m)
    if (x[.i] < .m) {
      text(x = .i, y = x[.i] - 0.55, labels = abs(round(.z[.i], 1)), col = "darkorange", srt = 90)
    } else {
      text(x = .i, y = x[.i] + 0.55, labels = abs(round(.z[.i], 1)), col = "darkgreen", srt = 90)
    }
  }

  points(x, pch = 20, cex = 2, col = rep("darkgray", 18), bty = "n", xlab ="", ylab = "")
  lines(x = c(1, 18), y = rep(.m, 2), col = "cadetblue", lwd = 3)

  legend("topleft", legend = paste0("sd = ", round(.s,2)), bty = "n", cex = 1.25)
}
zplot(x1)

pdf("fourzs.pdf")
par(mar = c(2, 2, 1, 1))
par(mfrow = c(2, 2))
zplot(x1)
zplot(x2)
zplot(x3)
zplot(x4)
dev.off()
par(mfrow = c(1, 1))
par(mar = c(5.1, 4.1, 4.1, 2.1))



# CI for proportions

pdf("sixteenbernoullis.pdf", width = 8, height = 5)
par(mar = c(2, 3, 1, 1))
par(mfrow = c(2, 8))
trial <- rbinom(16, 100, 0.39)
for (i in 1:16) {
  res <- c(trial[i], 100-trial[i])
  bp <- barplot(res, col = c("darkgreen", "darkred"), ylim = c(0,85), main = i, border = "white", yaxt = "n")
  text(bp[1], res[1]+8, res[1], cex = 1.8, col = "darkgreen")
  text(bp[2], res[2]+8, res[2], cex = 1.8, col = "darkred")
}
dev.off()
par(mfrow = c(1, 1))
par(mar = c(5.1, 4.1, 4.1, 2.1))

bernieplot <- function(t, line = F) {
  .tab <- table(t)
  .true <- which(names(.tab) == 39)
  .cols <- c(rep("lightgray", .true-1), "darkgreen", rep("lightgray", length(.tab)-.true))
  .bp <- barplot(.tab, col = .cols, main = paste0(length(trial), " Stichproben"), xlab = "Anteilswert mit Objekt", ylab = "Anzahl der Stichproben", border = "white")
  if (line) lines(.bp, .tab)
}

pdf("manybernoullis1.pdf")
bernieplot(trial)
dev.off()

trial <- c(trial, rbinom(84, 100, 0.39))
pdf("manybernoullis2.pdf")
bernieplot(trial)
dev.off()

trial <- c(trial, rbinom(900, 100, 0.39))
pdf("manybernoullis3.pdf")
bernieplot(trial)
dev.off()



# Normal for CI

pdf("ci95.pdf", width = 10, height = 5)
par(mar = c(2, 2, 1, 1))
rmean <- 0.39
rsf <- 0.0488
crv <- curve(dnorm(x, mean = rmean, sd = rsf), from = 0.1, to = 0.7, bty= "n", xlab = "Gemessener Anteilswert", ylab = "", yaxt = "n", xlim = c(0.1, 0.7), lwd = 2, cex.axis = 1.5)
imean <- which(c$x == 0.39)

int <- 1.96*rsf
lower95 <- rmean-int
upper95 <- rmean+int
ilower95 <- which.min(abs(crv$x-lower95))
iupper95 <- which.min(abs(crv$x-upper95))

polygon(
  c(crv$x[ilower95:iupper95], crv$x[iupper95:ilower95]),
  c(crv$y[ilower95:iupper95], rep(0, length(crv$y[ilower95:iupper95]))),
  col = "cadetblue3")

lines(rep(0.39, 2), c(0, crv$y[imean]), col = "navy", lwd = 4, lty = 3)
text(0.39+0.05, crv$y[imean], paste0("Q=0.39"), col = "navy", cex = 1.5)

lower <- rmean-rsf
upper <- rmean+rsf
ilower <- which.min(abs(crv$x-lower))
iupper <- which.min(abs(crv$x-upper))
lines(c(crv$x[ilower], crv$x[iupper]), c(crv$y[ilower], crv$y[ilower]), col = "darkred", lwd = 4, lty = 3)
text(crv$x[iupper]+0.08, crv$y[ilower], paste0("SF=±0.0488"), col = "darkred", cex = 1.5)

lines(c(crv$x[ilower95], crv$x[iupper95]), c(crv$y[ilower95], crv$y[ilower95]), col = "red", lwd = 4, lty = 3)
text(crv$x[iupper95]+0.12, crv$y[ilower95], paste0("1.96 x SF=±0.0956"), col = "red", cex = 1.5)

arrows(0.2, crv$y[ilower]-(crv$y[ilower]-crv$y[ilower95])/2, 0.3, crv$y[ilower]-(crv$y[ilower]-crv$y[ilower95])/2, lwd = 6, length = 0.15, col = "cadetblue")
text(0.21, crv$y[ilower]-(crv$y[ilower]-crv$y[ilower95])/2+0.3, "95% aller Werte", col = "cadetblue", cex = 1.5)
dev.off()
par(mar = c(5.1, 4.1, 4.1, 2.1))



# Variation in CIs

ci.prop <- function(p = 0.5, n = 100, sig = 0.95, width = T) {
  .se <- sqrt((p*(1-p)/n))
  .z <- qnorm((1-sig)/2, lower.tail = F)
  if (width) 2 * .se * .z
  else .se * .z
}

pdf("threecis.pdf", width = 8, height = 5)
par(mar = c(5, 3, 2, 0))
par(mfrow = c(1, 3))
ci.80.10 <- function(p) ci.prop(p = p, n = 10, sig = 0.8)
ci.80.100 <- function(p) ci.prop(p = p, n = 100, sig = 0.8)
ci.80.1000 <- function(p) ci.prop(p = p, n = 1000, sig = 0.8)
plot(ci.80.10(seq(0, 1, 0.01)), ty = "l", col = cols[1], lwd = 3,
     main = "80 % KI", ylim = c(0, 0.9), bty = "n", xaxt = "n", cex = 1.2,
     cex.axis = 1.2, cex.main = 1.2, cex.lab = 1.2, xlab = "", ylab = "")
axis(1, at = seq(1, 101, 10), labels = seq(0, 1, 0.1), cex = 1.2,
     cex.axis = 1.2, las = 2)
lines(ci.80.100(seq(0, 1, 0.01)), col = cols[2], lwd = 3, lty = 1)
lines(ci.80.1000(seq(0, 1, 0.01)), col = cols[3], lwd = 3, lty = 1)
legend("topleft", legend = c("n=10", "n=100", "n=1000"), lwd = 3, col = cols,
       bty = "n", cex = 1.2)

ci.95.10 <- function(p) ci.prop(p = p, n = 10)
ci.95.100 <- function(p) ci.prop(p = p, n = 100)
ci.95.1000 <- function(p) ci.prop(p = p, n = 1000)
plot(ci.95.10(seq(0, 1, 0.01)), ty = "l", col = cols[1], lwd = 3,
     main = "95 % KI", ylim = c(0, 0.9), bty = "n", cex = 1.2, cex.axis = 1.2,
     cex.main = 1.2, cex.lab = 1.2, yaxt = "n", xaxt = "n", xlab = "",
     ylab = "")
axis(1, at = seq(1, 101, 10), labels = seq(0, 1, 0.1), cex = 1.2,
     cex.axis = 1.2, las = 2)
mtext("Wahrer Anteilswert P", side = 1, line = 4)
lines(ci.95.100(seq(0, 1, 0.01)), col = cols[2], lwd = 3, lty = 1)
lines(ci.95.1000(seq(0, 1, 0.01)), col = cols[3], lwd = 3, lty = 1)

ci.99.10 <- function(p) ci.prop(p = p, n = 10, sig = 0.99)
ci.99.100 <- function(p) ci.prop(p = p, n = 100, sig = 0.99)
ci.99.1000 <- function(p) ci.prop(p = p, n = 1000, sig = 0.99)
plot(ci.99.10(seq(0, 1, 0.01)), ty = "l", col = cols[1], lwd = 3,
     main = "99 % KI", ylim = c(0, 0.9), bty = "n", cex = 1.2, cex.axis = 1.2,
     cex.main = 1.2, cex.lab = 1.2, yaxt = "n", xaxt = "n", ylab = "",
     xlab = "")
axis(1, at = seq(1, 101, 10), labels = seq(0, 1, 0.1), cex = 1.2,
     cex.axis = 1.2, las = 2)
lines(ci.99.100(seq(0, 1, 0.01)), col = cols[2], lwd = 3, lty = 1)
lines(ci.99.1000(seq(0, 1, 0.01)), col = cols[3], lwd = 3, lty = 1)
dev.off()
par(mfrow = c(1,1))
par(mar = c(5.1, 4.1, 4.1, 2.1))
