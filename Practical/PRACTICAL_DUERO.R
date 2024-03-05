#PRACTICAL EXAM ON DATA CLEANING

#A. 
#Load in warpbreaks
warpbreaks
#A.1 
str(warpbreaks)
#The 'breaks' column is numeric. 

#A.2
warpbreaks$breaks<-as.integer(warpbreaks$breaks)
str(warpbreaks$breaks)
#int [1:54] 26 30 54 25 70 52 51 26 67 18 ...

#A.3
#The column 'breaks' in warpbreaks is not the valid object for the subscript, resulting to mismatching between the subscript and it object's underlying type. 


#B
#B.1
(txt<-readLines("C:/Users/User/Documents/Rstudio Files/PRACTICAL/exampleFile.txt"))
#[1] "// Survey data. Created : 21 May 2013" "// Field 1: Gender"                   
#[3] "// Field 2: Age (in years)"            "// Field 3: Weight (in kg)"           
#[5] "M;28;81.3"                             "male;45;"                             
#[7] "Female;17;57,2"                        "fem.;64;62.8"    

#B.2
comments <- txt[grepl("^//", txt)]
data <- txt[!grepl("^//", txt)]
comments
#[1] "// Survey data. Created : 21 May 2013" "// Field 1: Gender"                   
#[3] "// Field 2: Age (in years)"            "// Field 3: Weight (in kg)"  

data
#"M;28;81.3"      "male;45;"       "Female;17;57,2" "fem.;64;62.8" 

#B.3 
comments_date <- gsub("^// Survey data. Created : ", "", comments[1])
comments_date
#[1] "21 May 2013"

#4.a
split_data <- strsplit(data, ";")
split_data
#[[1]]
#[1] "M"    "28"   "81.3"

#[[2]]
#[1] "male" "45"   NA    

#[[3]]
#[1] "Female" "17"     "57,2"  

#[[4]]
#[1] "fem." "64"   "62.8"

#4.b
max_num_fields <- max(sapply(split_data, length))
max_num_fields
#The max field is 3. 

split_data <- lapply(split_data, function(x) c(x, rep(NA, max_num_fields 
                             -length(x))))

#4.c
exampleFile_matrix <- matrix(unlist(split_data), ncol = max_fields, byrow = TRUE)
exampleFile_matrix
#[,1]     [,2] [,3]  
#[1,] "M"      "28" "81.3"
#[2,] "male"   "45" NA    
#[3,] "Female" "17" "57,2"
#[4,] "fem."   "64" "62.8"

#4.d
field_names <- gsub("^// Field [0-9]+: ", "", comments[2:4])
field_names
#"Gender"         "Age (in years)" "Weight (in kg)"

colnames(exampleFile_matrix) <- field_names

exampleFile_matrix
# Gender   Age (in years) Weight (in kg)
#[1,] "M"      "28"           "81.3"        
#[2,] "male"   "45"           NA            
#[3,] "Female" "17"           "57,2"        
#[4,] "fem."   "64"           "62.8"  