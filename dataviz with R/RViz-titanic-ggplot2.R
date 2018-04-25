# Kode R ini digunakan untuk keperluan training IYKRA - Data Visualization with R

#install.packages("ggplot2")
library(ggplot2)

# Menge-load data
setwd("D:/data/learning/dataviz/IntroDataVisualizationWithRAndGgplot2")
titanic <- read.csv("titanic.csv", stringsAsFactors = FALSE)
View(titanic)


# Set up factors. Mengapa harus menggunakan tipe data factors?
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#
# Tipe data faktor sangat umum dalam urusan bisnis, dan ggplot2 
# menawarkan banyak fitur yang menarik untuk memvisualkan tipe data factor. 
#


#
# Pertanyaan 1: Yang Survived vs Yang tidak Survived?
#
# Bar chart (geom_bar) bagus untuk memvisualkan data faktor
# 
#
ggplot(titanic, aes(x = Survived)) + 
  geom_bar()

# jika ingin tahu proporsinya...
prop.table(table(titanic$Survived))

# Tambahkan label dan theme-nya
ggplot(titanic, aes(x = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Jumlah Penumpang",
       title = "Tingkat Survival Penumpang Titanic")


#
# Pertanyaan kedua - Bagaimana Tingkat Kelangsungan Hidup berdasarkan jenis kelamin?
#
# Warna dapat digunakan untuk memperlihatkan dua dimensi data secara simultan. 
#
ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Jumlah Penumpang",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Jenis Kelamin")

#
# Pertanyaan ketiga - Bagaimana Tingkat Kelangsungan Hidup berdasarkan kelas tiket?
#
ggplot(titanic, aes(x = Pclass, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Jumlah Penumpang",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Kelas Tiket")


#
# Pertanyaan keempat - Bagaimana Tingkat Survival Penumpang Titanic berdasarkan jenis kelamin dan kelas tiket?
#
# Kita dapat menggunakan facets untuk men-segmentasi 
#
ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Jumlah Penumpang",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Jenis Kelamin dan Kelas Tiket")



#
# Kalau tadi kita menggunakan data faktor, sekarang kita berlatih menggunakan data numerik
# 

#
# Pertanyaan kelima: Bagaimana distribusi umur penumpang?
#
# The histogram is a staple of visualizing numeric data as it very 
# powerfully communicates the distrubtion of a variable (i.e., column).
#
ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Umur",
       x = "Umur - interval 5",
       title = "Distribusi Umur Penumpang Titanic")


#
# Pertanyaan keenam - Bagaimana Tingkat Survival berdasarkan Umur?
#
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Jumlah Penumpang",
       x = "Umur - interval 5 tahun)",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Umur")

# Visualisasi yang bagus lainnya adalah tipe box-and-whisker plot

ggplot(titanic, aes(x = Survived, y = Age)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Umur",
       x = "Survived",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Umur")


#
# Pertanyaan ketujuh - Bagaimana tingkat survival berdasarkan umur jika
#                     disegmentasikan berdasarkan jenis kelamin dan kelas tiket?
#
# Visualisasi yang terkait dengan histogram adalah plot density, dengan kata lain 
# plot density ini merupakan versi "halus" atau smooth nya histogram. 
#
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_density(alpha = 0.5) +
  labs(y = "Proporsi density",
       x = "Umur",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Umur, Jenis Kelamin, dan Kelas Tiket")

# Jika lebih suka histogram, silakan gunakan kode ini
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Jumlah Penumpang",
       x = "Umur",
       title = "Tingkat Survival Penumpang Titanic berdasarkan Umur, Jenis Kelamin, dan Kelas Tiket")

