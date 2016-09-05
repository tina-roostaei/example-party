# cleans datasheets of irregularly data types, fixes factors
#
# Run: 
#   R --no-save < clean.R

cog = read.csv("messy_cognitive.csv")
gen = read.csv("messy_genotype.csv")
dem = read.csv("messy_demographic.csv")

dem[dem==""] = NA
dem[dem=="missing"] = NA
dem[dem=="9999"] = NA
dem$age = as.numeric(as.character(dem$age))
dem$ethnicity = factor(dem$ethnicity,levels=c("Cauc","AA","As","In","Other"))
dem$sex = factor(dem$sex, levels=c(0,1), labels=c("Male","Female"))
dem$dx = factor(dem$dx, levels=c(0,1), labels=c("Control","Case"))

gen[gen==""] = NA
gen[gen=="missing"] = NA
gen[gen=="9999"] = NA
gen$genotype = factor(gen$genotype, levels=c(0,1,2), labels=c("AA","AG","GG"))
gen$subID = gsub(gen$subID,pattern="subject",replacement="SUB_")

cog[cog==""] = NA
cog[cog=="missing"] = NA
cog[cog=="9999"] = NA
cog$cog1 = as.numeric(as.character(cog$cog1))
cog$cog2 = as.numeric(as.character(cog$cog2))
cog$cog3 = as.numeric(as.character(cog$cog3))
cog$subID = gsub(cog$subID,pattern="subject",replacement="SUB_")


all = merge(dem,
            merge(cog, gen, by="subID"), 
            by.x="subject_ID",by.y="subID")

write.csv(cog, "clean_cognitive.csv", row.names=F)
write.csv(gen, "clean_genotype.csv", row.names=F)
write.csv(dem, "clean_demographic.csv", row.names=F)
write.csv(all, "clean_all.csv", row.names=F)
