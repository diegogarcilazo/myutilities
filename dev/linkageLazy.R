library(tidyverse)
library(RecordLinkage)

  db <- readxl::read_excel("../../../DashboardTB/datasets/bases/old/ArgTb2018_20190805.xlsx")


db2 <- db %>%
  mutate(
    PatientId = row_number()
    ) 

rpairs <- db2 %>% 
  select(Apellido, Nombres, Fecha_Nacimiento, Numero_dni, PatientId, Sexo, Provincia) %>% 
  RecordLinkage::compare.dedup(
    blockfld = list(c("Sexo", "Provincia")),
    identity = db2$PatientId,
    exclude = c("PatientId"),
    strcmp = c("Numero_dni"),
    phonetic = c("Apellido", "Nombres"))

RecordLinkage::getPairs(rpairs, .8) %>% View



