#See previous tab for set up of sns dataframe

#Unnest_tokens splits the lines into separate words. Specify output (word) and 
#input (text).

words_df<-sns%>%
  unnest_tokens(word,text)

#Remove stop_words = a, after, about, = mostly articles and prepositions
#Filter the words that are not equal (!) to stop words, in% = belongs to 

words_df<-words_df%>%
  filter(!(word %in% stop_words$word))

#Count and display the frequency of each word.

word_freq<-words_df%>%
  group_by(word)%>%
  summarize(count=n())

#Display the results in a wordcloud.  Keep running until you get one that you 
#like.  If there is an error message that some words will
#not fit so they won't be plotted, increase the size of
#the plot window.
#Minimum frequency set at 25 for each word to display on the word cloud
#Born to run example included color...
#wordcloud(word_freq$word,word_freq$count,colors=brewer.pal(3,'Dark2')) 

wordcloud(word_freq$word,word_freq$count,min.freq=25)
