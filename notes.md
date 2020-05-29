# Week Four notes
## Excel and R
- https://www.youtube.com/watch?v=Cmd8cJCk2lA
- https://www.dummies.com/programming/r/how-to-substitute-text-in-r/
- https://stackoverflow.com/questions/21187603/replace-characters-from-a-column-of-a-data-frame-r
- worked to replace it! used `documents$Newspaper.City <- gsub("Edinbugh", "Edinburgh", documents$Newspaper.City)`

- [other basic visualizations](https://rstudio-pubs-static.s3.amazonaws.com/7953_4e3efd5b9415444ca065b1167862c349.html)
- https://ourworldindata.org/world-population-growth#all-charts-preview

## Voyant
- questions to ask before exploring the data:
  - what is it about?
  - what does it say about something significant? (ie. friendship)
  - what words stand out in the word cloud? what words do you expect to see?
  - how does the langugae change throughout the text? are some words important at the beginning and some at the end?
  - how to correspondences travel? 
  - is there a change over time as the Americas seek autonomy?
- united, kingdom, new, inform, scotland
- clicking a term changes the trends on the right side
- the word "new" increases as time goes on, it is also the most frequent word
- word "mr" is mentioned often, so mostly writing about men
- clicking on multiple terms plots those terms on the graph
- used [this video](https://www.youtube.com/watch?v=enjhlnqaXOE) to learn how to embedd html in github
- [posted my embedded visualizatons here](https://paula-rodrigo.github.io/week-four/)
- found it difficult to interpret patters when I don't have a specific idea in mind or argument
- I thought that the dreamscape visualization was interesting because it broadly showed what places newspapers were writing about
  - many reports about Quebec, and America in the Northeast
  - TermBerries visualizaiton shows words that appear near each other and how often they occur (ex. Canada and war)
 - not sure when to stop looking
  

## AntConc
- corpus constrution: questions of sampling, representiveness, and organization
- I really like the Collocate feature
- allows for a far reading before looking at the words in context
- I can imagine how the process can take a long time because researchers have to clearn the OCR'd text and then select which files they're going to examine 
- the paterns that come up may take a long time to go through as well
- How do the chapbooks write about women compared to men? 
- What kind of writing do chapbooks produce about women?
- expecting there to be less mention of women than men, expecting the mentions of women to be more superficial than men 
  - for instance, focusing more on women's looks or mentioning them in relation to someone else
- good tool for making comparisons between text (different genres, time periods, topics, etc.)
- next time, I would use this tool on a more specific set of texts so that it is easier to ask questions about the patterns that appear
- word frequency list
- how do you know if your explanation/conclusion is the correct one? must try to find other reasons or compare to a reference corpus or compare to other instances of the word/phrase within the same corpus (for example look* a little and look a little in https://datasittersclub.github.io/site/dsc4/)
- interesting to see how you can use AntConc with OpenRefine
- things surrounding the word that can change it's meaning
- context around the word--when is it used? who says/writes it?
- using tags
- how do we know when to stop?

## Topic Models
- error
- choose the number of topics
- decide what to name the topics
- the way the documents are divided up
  - could have divided by date or publisher or writer
- error message
- error message 
https://github.com/kbroman/RqtlWorkshop/issues/1

## bonus activity

