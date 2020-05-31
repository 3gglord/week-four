unicorns <- read.table(text = x, col.names=c("Birthweight", "Sex", "Longevity"), colClasses=rep("character", 3), sep=",", quote="")

height <- c(145, 167, 176, 123, 150)
weight <- c(51, 63, 64, 40, 55)

plot(height,weight)

tarsus <- read.table("tarsus.txt", header = T)
tarsus

tarsus$TarsusLength
tarsus$Weight

plot(tarsus$TarsusLength,tarsus$Weight)

tarsus.tab <- table(tarsus$TarsusLength)
plot(tarsus.tab)
barplot(tarsus.tab)

unicorns <- read.table("unicorn.txt" ,header = T)
head(unicorns)
str(unicorns)
hist(unicorns$birthweight)            # normal distribution
unicorns <- read.table("unicorn.txt" ,header = T)
hist(unicorns$birthweight)            # normal distribution
hist(unicorns$longevity)              # poisson distribution
unicorns <- read.table("unicorn.txt" ,header = T)
hist(unicorns$longevity)              # poisson distribution
hist(unicorns$birthweight, breaks = 40)
hist(unicorns$birthweight, breaks = c(0,1,2,3,4,5,6,7))
hist(unicorns$birthweight, breaks = c(0,1,2,3,4,7))
hist(unicorns$birthweight, breaks = 40, xlab = "Birth Weight")
hist(unicorns$birthweight,
     breaks = 40,
     xlab = "Birth Weight",
     main = "Histogram of Unicorn Birth Weight")
hist(unicorns$birthweight,
     breaks = 40,
     xlab = "Birth Weight", 
     main = "Histogram of Unicorn Birth Weight",
     ylim = c(0,6))

plot(unicorns$birthweight, unicorns$longevity, type = "l")     # Try "o" "p" "l" "b"
unicorns <- read.table("unicorn.txt" ,header = T)
plot(unicorns$birthweight, unicorns$longevity, type = "l")     # Try "o" "p" "l" "b"
unicorns <- read.table("unicorn.txt" ,header = T)
plot(unicorns$birthweight, unicorns$longevity, type = "l")     # Try "o" "p" "l" "b"

moomins <- read.table("moomins.txt" ,header = T)
plot(moomins$year, moomins$Popsize, type = "l")     # Try "o" "p" "l" "b"
moomins <- read.table("moomins.txt" ,header = T)
plot(moomins$year, moomins$Popsize, type = "l")     # Try "o" "p" "l" "b"
plot(moomins$Year, moomins$PopSize)
plot(moomins$Year, moomins$PopSize, type = "l")
plot(moomins$Year, moomins$PopSize, type = "l", lty = "dashed")
plot(moomins$Year, moomins$PopSize, type = "l") #col to change the colour, lwd to change the line width

plot(moomins$Year, moomins$Popsize, 
     type = "l", 
     col = "red", 
     lwd = 3,
     xlab = "Year",
     ylab = "Population Size",
     main = "Moomin Population Size on Ruissalo 1971 - 2000")

fit1 <- lm (Popsize ~ Year, data = moomins) 
summary(fit1)  

abline(fit1, lty = "dashed")                            # add the regression line to the plot
text(x = 1978, y = 750, labels = "R2 = 0.896\nP = 2.615e-15")   # add a label to the plot at (x,y)



