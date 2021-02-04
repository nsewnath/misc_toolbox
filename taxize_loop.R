# Loop for finding corresponding family names for each genus using taxize package. 

# Neeka Sewnath
# nsewnath@ufl.edu

# Input: Two column dataframe: One column labeled "Genus". Second column labeled "Family"
# Switch "family" and "genus" to any taxonomic level 

#install.packages("taxize")
library(taxize)

# Read csv file 
taxa_list <- read.csv("genus_names.csv")

# Loop through file, assign family name to corresponding genus
for (i in 1:nrow(taxa_list)){
  print(i)
  x = tax_name(query = taxa_list$Genus[i], get = "family", db = "ncbi")
  taxa_list$Family[i] = x[,3]
  Sys.sleep(1)
}

# Write table
write.csv(taxa_list, file = "genus_family_names.csv")


