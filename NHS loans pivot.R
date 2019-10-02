# openrefine the names of each

# check col names are the same

names(X2016_17)

# change if necessary

names(X2018_19)[3] <- "Org name"

# Bind the data together

Fullbind <- rbind(X2016_17,X2017_18,X2018_19)

# Take out any NA rows

Fullbind <- na.omit(Fullbind)

# Take out any spaces or commas and replace them with full stops 

names(Fullbind)<-str_replace_all(names(Fullbind), c(" " = "." , "," = "" ))

# check the column can be summed and is numeric

str(Fullbind)

# It wasn't, it was a character string with , and £ in - so take those out

Fullbind$SUM.of.Closing.balance <- gsub(",","", Fullbind$SUM.of.Closing.balance)
Fullbind$SUM.of.Closing.balance <- gsub("£","", Fullbind$SUM.of.Closing.balance)

# Change the column to a numeric cell

Fullbind$SUM.of.Closing.balance <- as.numeric(as.character(Fullbind$SUM.of.Closing.balance))

# Group the data (filter) by organisation name and Sum the total balance for our pivot table

Grouptest <- Fullbind %>% select(Org.name,SUM.of.Closing.balance) %>% group_by(Org.name) %>% summarise(SUM.of.Closing.balance=sum(SUM.of.Closing.balance))

# export as a csv

write.csv(Fullbind,"Fullbind.csv")

