## save the script as Middle_eastern.R 

data<- read.table("HGDP_938.geno", header=F, stringsAsFactors=F)

Middle_eastern <- data[which(data$V1 =="Bedouin" | data$V1 =="Druze" | data$V1 =="Palestinian" ),]

African <- data[which(data$V1 == "BiakaPygmy" | data$V1 == "BantuKenya" | data$V1 == "BantuSouthAfrica" |data$V1 == "Mandenka" | data$V1 == "MbutiPygmy" | data$V1 == "Mozabite" |data$V1 == "San" | data$V1 == "Yoruba" ),]

European <- data[(data$V1 == "Adygei"  | data$V1 == "Basque"| data$V1 == "French" | data$V1 == "Italian" | data$V1 == "Orcadian" | data$V1 == "Russian" | data$V1 == "Tuscan" | data$V1 == "Sardinian" ),]

CS_Asian <- data[(data$V1 == "Balochi"  | data$V1 == "Brahui" | data$V1 == "Burusho" | data$V1 == "Hazara" | data$V1 == "Kalash" | data$V1 == "Makrani" | data$V1 == "Pathan" | data$V1 == "Sindhi" | data$V1 == "Uygur" ),]

East_Asian<- data[(data$V1 == "Cambodian"  | data$V1 == "Dai" | data$V1 == "Daur" | data$V1 == "Han" | data$V1 == "Han-NChina" | data$V1 == "Hezhen" | data$V1 == "Japanese" | data$V1 == "Lahu" | data$V1 == "Miao" | data$V1 == "Mongola" | data$V1 == "Naxi" | data$V1 == "Oroqen" | data$V1 == "She" | data$V1 == "Tu" | data$V1 == "Tujia" | data$V1 == "Xibo" | data$V1 == "Yakut" | data$V1 == "Yi" ),]

Oceanian <- data[(data$V1 == "Melanesian"  | data$V1 == "Papuan" ),]

Nat_Ame <- data[(data$V1 == "Colombian"  | data$V1 == "Karitiana" | data$V1 == "Maya" | data$V1 == "Pima" | data$V1 == "Surui"),]

## Middle_eastern
Middle_eastern_T<- t(Middle_eastern)

FreqTotal<- NULL
for (i in 3:dim(Middle_eastern_T)[1]){
	SumAllele <- sum(as.numeric(Middle_eastern_T[i,])) + (9 * length(which(Middle_eastern_T[i,]=="-9")))
	TotalAllele <- (dim(Middle_eastern_T)[2]*2-length(which(Middle_eastern_T[i,]=="-9")))
	Freq <- SumAllele/TotalAllele
	FreqTotal <- rbind(FreqTotal, Freq)
}


write.table(FreqTotal, file="Freq_Middle_eastern.frq", row.names=F, col.names=F, quote=F, sep="\t" )


## In bash ##
## sed 's/Middle_eastern/African/g' Middle_eastern.R > African.R
## sed 's/Middle_eastern/European/g' Middle_eastern.R > European.R
## sed 's/Middle_eastern/CS_Asian/g' Middle_eastern.R > CS_Asian.R
## sed 's/Middle_eastern/East_Asian/g' Middle_eastern.R > East_Asian.R
## sed 's/Middle_eastern/Oceanian/g' Middle_eastern.R > Oceanian.R
## sed 's/Middle_eastern/Nat_Ame/g' Middle_eastern.R > Nat_Ame.R