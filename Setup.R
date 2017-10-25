#Load 6 packages:  dplyr, tm, tidytext, wordcloud, stringr, janeaustenr

#sns is our name for the dataframe for Sense&Sensibility exercise.  austen_books 
#is the data from the package we loaded

sns<-austen_books()

sns<-sns%>%
  filter(book == 'Sense & Sensibility')

#typing head(sns$book) and tail(sns$book) in the console
#shows only the book S&S remains in the data

#convert the words in the book column (hence the $ sign) to character 
#in case they are in a different format

sns$book<-as.character(sns$book)

#We want to remove the chapter heading.  ^ means "starts with". ! means not.        

str_detect(sns$text,'^CHAPTER')

sns%>%
  filter(!str_detect(sns$text,'^CHAPTER'))

#Remove the text from the first and last few pages of the book.  Must have rows
#and columns in the expression below.  12:12574 are rows and the comma denotes columns
#but we don't need to add any columns.  Read the ones we want to keep into the 
#dataframe.

sns<-sns[12:12574,]
sns<-sns[1:12562,]
  
