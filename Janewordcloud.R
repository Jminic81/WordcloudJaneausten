words_df<-sns%>%
  unnest_tokens(word,text)

words_df<-words_df%>%
  filter(!(word %in% stop_words$word))

word_freq<-words_df%>%
  group_by(word)%>%
  summarize(count=n())

#Minimum frequency set at 25 for each word to display on the word cloud

wordcloud(word_freq$word,word_freq$count,min.freq=25)
