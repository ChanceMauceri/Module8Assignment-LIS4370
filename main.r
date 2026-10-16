# 1. Import DataSet.txt
student6 <- read.csv(
  file.choose(),
  header = TRUE,
  stringsAsFactors = FALSE
)

# Check the imported column names and data
names(student6)
head(student6)

# 2. Load the plyr package
library(plyr)

# 3. Calculate the mean Grade by Sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Display the results for mean 
print(gender_mean)

# 4. Write the grouped means to a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# 5. Find names containing the letter i (uppercase or lowercase)
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Display the matching students
print(i_students)

# 6. Write the matching names to a CSV file
write.csv(
  i_students["Name"],
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# 7. Write the filtered dataset to file
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# 8. Check if all files exist
file.exists(c(
  "gender_mean.txt",
  "i_students.csv",
  "i_students_full.csv"
))

