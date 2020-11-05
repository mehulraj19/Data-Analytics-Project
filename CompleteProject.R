
#PreProcessing
library(dplyr)
myDat = read.csv("book1000k-1100k.csv")

d1 = myDat$RatingDist1
d2 = myDat$RatingDist2
d3 = myDat$RatingDist3
d4 = myDat$RatingDist4
d5 = myDat$RatingDist5
Total = myDat$RatingDistTotal

d1 = strsplit(d1, ":")
for(i in 1:length(d1)){
 d1[[i]] = d1[[i]][2]
}
d1 = as.integer(d1)

d2 = strsplit(d2, ":")
for(i in 1:length(d2)){
  d2[[i]] = d2[[i]][2]
}
d2 = as.integer(d2)

d3 = strsplit(d3, ":")
for(i in 1:length(d3)){
  d3[[i]] = d3[[i]][2]
}
d3 = as.integer(d3)

d4 = strsplit(d4, ":")
for(i in 1:length(d4)){
  d4[[i]] = d4[[i]][2]
}
d4 = as.integer(d4)

d5 = strsplit(d5, ":")
for(i in 1:length(d5)){
  d5[[i]] = d5[[i]][2]
}
d5 = as.integer(d5)


#Model1

book_Name = filter(myDat, myDat$Name == 'Individuals in Context: A Practical Guide to Client Centered Practice')
book_Name

#Books filter based on Author
book_Author = filter(myDat, myDat$Authors == 'Virginie Fowler Elbert')
book_Author$Name


#Books filter based on Ratings
book_Rating5 = filter(myDat, d5>3)
head(book_Rating5$Name, 10)

book_Rating4 = filter(myDat, d4>5)
head(book_Rating4$Name, 10)

book_Rating3 = filter(myDat, d3>2)
head(book_Rating3$Name, 10)

book_Rating2 = filter(myDat, d2<5)
head(book_Rating2$Name, 10)

book_Rating1 = filter(myDat, d1<1)
head(book_Rating1$Name, 10)

book_Total = filter(myDat, myDat$RatingDistTotal < 50)
head(book_Total$Name, 10)



# Books filter based on count of reviews
book_countReview = filter(myDat, myDat$CountsOfReview < 10)
head(book_countReview$Name, 10)


#Multiple filter simultaneously

book_Ratings = filter(myDat, d5>3 , d4<3, d3>2, d2>3, d1 == 1)
head(book_Ratings$Name, 10)

book_VFElbert = filter(myDat, myDat$Authors == 'Virginie Fowler Elbert' & myDat$RatingDistTotal > 2)
book_VFElbert$Name


#Books Published in My Birthday
book_Bdate = filter(myDat, PublishYear==2000 & PublishDay==28 & PublishMonth==8)
book_Bdate$Name



#Model2
priorty = rep(0, length(d1))
Book_Priority = cbind(myDat, priorty)

head(Book_Priority, 10)

book_VFElbert = filter(Book_Priority, Book_Priority$Authors == 'Virginie Fowler Elbert')
book_VFElbert$Name
chosen_book = readline(prompt="Enter the Book You want: ")

for(i in 1:length(d1)){
  if(chosen_book == Book_Priority$Name[i]){
    Book_Priority$priorty[i] =  Book_Priority$priorty[i] + 1
  }
}

Book_Priority = arrange(Book_Priority, desc(Book_Priority$priorty))
head(Book_Priority$Name, 10)


#Model3
# Filter Prioritizing for books:
#   
# 1. Name of the book
# 2. Name of the  author
# 3. Average Rating with 4+
# 4. Number of reviews
# 5. Number of pages.

Name_Author = readline(prompt = "Enter Name of the Author: ") 
Name_Book = readline(prompt = "Enter Name of the Book: ")
Rating_Book = readline(prompt = "Enter number of Ratings: ")
Rating_Book = as.integer(Rating_Book)
Number_of_reviews = readline(prompt = "Enter number of reviews: ")
Number_of_reviews = as.integer(Number_of_reviews)
Number_of_pages = readline(prompt = "Enter number of pages: ")
Number_of_pages = as.integer(Number_of_pages)

#Main filter
Book = filter(Book_Priority, Book_Priority$Name ==  Name_Book)
Book
#Taking Secondary Filter that is important
Book = filter(Book_Priority,  Book_Priority$Authors ==  Name_Author)
Book = filter(Book, Book$Rating > Rating_Book)
Book = filter(Book, Book$CountsOfReview >  Number_of_reviews )
Book = filter(Book, Book$pagesNumber > Number_of_pages)



#Using Model 2 after Model 3
Book$Name
n = length(Book$Name)
if(n > 1){
  chosen_book = readline(prompt="Enter the Book You want: ")
}else{
  chosen_book = Book$Name
}

for(i in 1:length(d1)){
  if(chosen_book == Book_Priority$Name[i]){
    Book_Priority$priorty[i] =  Book_Priority$priorty[i] + 1
  }
}

Book_Priority = arrange(Book_Priority, desc(Book_Priority$priorty))
head(Book_Priority$Name, 10)

#Visualization for Ratings
num = 0
for(i in 1:length(d1)){
  if( Book$Name == Book_Priority$Name[i]){
    num = i
    print(num)
  }
}
r1 = strsplit(Book_Priority$RatingDist1[num], ":")
r1 = r1[[1]][2]
r1 = as.integer(r1)

r2 = strsplit(Book_Priority$RatingDist2[num], ":")
r2 = r2[[1]][2]
r2 = as.integer(r2)

r3 = strsplit(Book_Priority$RatingDist3[num], ":")
r3 = r3[[1]][2]
r3 = as.integer(r3)

r4 = strsplit(Book_Priority$RatingDist4[num], ":")
r4 = r4[[1]][2]
r4 = as.integer(r4)

r5 = strsplit(Book_Priority$RatingDist5[num], ":")
r5 = r5[[1]][2]
r5 = as.integer(r5)

Ratings = c(r1, r2, r3, r4, r5)
labeling = c("1*", "2*", "3*", "4*", "5*")

library(plotrix)
par(mfrow=c(1,2))
pie3D(Ratings, labels = labeling, explode = 0.05, main=Book$Name, col=rainbow(length(labeling)))
pie(Ratings, labels = labeling, main=Book$Name, col=rainbow(length(labeling)))
par(mfrow=c(1,1))
barplot(Ratings,ylab = "Ratings", names.arg = labeling, horiz=T,col="darkred", main = chosen_book)
#Visualization of Books published in my Birth Date
Ratings = c(book_Bdate$RatingDistTotal)
labeling = c(book_Bdate$Name)
pie(Ratings, labels = labeling, 
    main = "Books published in my Birthday: Total Ratings Given",
    col=rainbow(length(labeling)))

#Number of books Published Every Year
library(plyr)
books = ddply(Book_Priority,~PublishYear,summarise,books=length(unique(Book_Priority$PublishYear)))
books
