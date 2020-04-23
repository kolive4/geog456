library(raster)
library(RStoolbox)

setwd("/Users/kyleoliveira4/Desktop/8thSemester/GEOG456/GitHub/geog456/BrickMaps")

img_1985 = brick("Y1985.jpg", nl = 3)
img_1995 = brick("Y1995.jpg", nl = 3)
img_2000 = brick("Y2000.jpg", nl = 3)
img_2005 = brick("Y2005.jpg", nl = 3)
img_2019 = brick("Y2019.jpg", nl = 3)

names(img_1985) = c("red_1985", "green_1985", "blue_1985")
names(img_1995) = c("red_1995", "green_1995", "blue_1995")
names(img_2000) = c("red_2000", "green_2000", "blue_2000")
names(img_2005) = c("red_2005", "green_2005", "blue_2005")
names(img_2019) = c("red_2019", "green_2019", "blue_2019")

par(mfrow = c(5,1))
plotRGB(img_1985)
plotRGB(img_1995)
plotRGB(img_2000)
plotRGB(img_2005)
plotRGB(img_2019)

par(mfrow = c(5,3))
hist(img_1985, maxpixels = 1000)
hist(img_1995, maxpixels = 1000)
hist(img_2000, maxpixels = 1000)
hist(img_2005, maxpixels = 1000)
hist(img_2019, maxpixels = 1000)

img_1985_matched = histMatch(img_1985, img_2019, forceInteger = TRUE) ## This will take a while, be patient
img_1995_matched = histMatch(img_1995, img_2019, forceInteger = TRUE)
img_2000_matched = histMatch(img_2000, img_2019, forceInteger = TRUE)
img_2005_matched = histMatch(img_2005, img_2019, forceInteger = TRUE)

par(mfrow = c(2,3))
hist(img_2019, maxpixels = 1000)


par(mfrow = c(1,3))
plotRGB(img_1985)
plotRGB(img_1985_matched)

writeRaster(img_1985_matched, filename = "matched1985.tif", format = "GTiff", datatype = "INT1U") ## don't forget to put datatype = INT1U otherwise only ESRI and QGIS will be able to open this geoTiff.
writeRaster(img_1995_matched, filename = "matched1995.tif", format = "GTiff", datatype = "INT1U")
writeRaster(img_2000_matched, filename = "matched2000.tif", format = "GTiff", datatype = "INT1U")
writeRaster(img_2005_matched, filename = "matched2005.tif", format = "GTiff", datatype = "INT1U")
writeRaster(img_2019, filename = "2019.tif", format = "GTiff", datatype = "INT1U")
