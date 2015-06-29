### Dump all R objects to a file

filepath  <- file.choose()

### Machine Readable
dump(ls(), file = filepath, append = FALSE,
     control = "all", envir = parent.frame(), evaluate = TRUE)

filepath  <- file.choose()

### Human Readable
dump(ls(), file = filepath, append = FALSE,
     control = NULL, envir = parent.frame(), evaluate = TRUE)


### To turn a dataframe into a csv

### Choose your file
filepath  <- file.choose()
### Write x= your dataframe to file
write.csv(file=filepath, x=ASC_F_CTR_F)

filepath  <- file.choose()
write.csv(file=filepath, x=ASC_F_CTR_F_notmissing)

filepath  <- file.choose()
write.csv(file=filepath, x=ASC_M_CTR_M)

filepath  <- file.choose()
write.csv(file=filepath, x=ASC_M_CTR_M_2)

filepath  <- file.choose()
write.csv(file=filepath, x=Erin_F)

filepath  <- file.choose()
write.csv(file=filepath, x=Erin_M_1)

filepath  <- file.choose()
write.csv(file=filepath, x=MRC_AIMS_M_1)



### Multiple dataframes into multiple CSVs
mcsv_w(ASC_F_CTR_F, ASC_F_CTR_F_notmissing, ASC_M_CTR_M, ASC_M_CTR_M_2, Erin_F, Erin_M_1, MRC_AIMS_M_1, dir="df_dump_22_06_15")

