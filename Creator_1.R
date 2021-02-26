Students = function(){
  #Alter auf ganze Zahlen gerundet wird normalverteilt gezogen mit Mittelwert 25 und 
  #Standardabweichung 2
  Alter = round(rnorm(100, mean = 25, sd = 2))
 
  #Studienfaecher
  Stud = c("Statistik", "Data Science", "Informatik", "Mathe")
  
  #Studienfach Anteil
  prob_stud = c(0.3, 0.3, 0.25, 0.15)
  
  #Zuweisung Stidienfach
  Studienfach = Stud[sample(1:4, size = 100, replace = TRUE, prob = prob_stud)]
  
  #Verteilung fuer das Interesse an Mathematik, je nach Studienfach,
  #Statistiker haben im Schnitt keine Praeferenz, waehrend Informatiker eher kein Mathe moegen
  #Mathematiker moegen Mathe sehr - oh Wunder!
  prob_intm = function(){
    prefs = 1:100
    for(i in seq_along(Studienfach)){
      if(Studienfach[i] == "Statistik"){
        prefs[i] = sample(1:7, size = 1, prob = rep(1/7, 7))
      }
      else if(Studienfach[i] == "Data Science"){
        prefs[i] = sample(1:7, size = 1, prob = c(0.15, 0.25, 0.3, 0.2, 0.5, 0.25, 0.25) )
      }
      else if(Studienfach[i] == "Informatik"){
        prefs[i] = sample(1:7, size = 1, prob = c(0.25, 0.35, 0.5, 0.3, 0.2, 0.15, 0.15) )
      }
      else if(Studienfach[i] == "Mathe"){
        prefs[i] = sample(1:7, size = 1, prob = c(0.025, 0.05, 0.1, 0.175, 0.15, 0.2, 0.3) )
      }
    }
    return(prefs)
  }
  Int_M = prob_intm()
  
  #Verteilung fuers Interesse an Programmieren, aehnlich wie oben 
  prob_intp = function(){
    prefs = 1:100
    for(i in seq_along(Studienfach)){
      if(Studienfach[i] == "Statistik"){
        prefs[i] = sample(1:7, size = 1, prob = rep(1/7, 7) )
      }
      else if(Studienfach[i] == "Data Science"){
        prefs[i] = sample(1:7, size = 1, prob = c(0.025, 0.05, 0.1, 0.175, 0.15, 0.2, 0.3) )
      }
      else if(Studienfach[i] == "Informatik"){
        prefs[i] = sample(1:7, size = 1, prob = c(0.025, 0.05, 0.1, 0.175, 0.15, 0.2, 0.3) )
      }
      else if(Studienfach[i] == "Mathe"){
        prefs[i] = sample(1:7, size = 1, prob = rep(1/7, 7) )
      }
    }
    return(prefs)
  }
  Int_P = prob_intp()
  
  #Mathe LK Abhaengig davon, ob die Studierenden Mathe als Studienfach haben, 
  #Oder das Interesse an Mathematik mindestens 4 ist.
  prob_LK = function(){
    prefs = 1:100
    for(i in seq_along(Studienfach)){
     if(Studienfach[i] == "Mathe"){
        prefs[i] = sample(0:1, size = 1, prob = c(0.25, 0.75) )
     }
      else if(Int_M[i] >= 4 ){
        prefs[i] = sample(0:1, size = 1, prob = c(0.35, 0.65) )
      }
      else{
        prefs[i] = sample(0:1, size = 1, prob = c(0.45, 0.55) )
      }
    }
    return(prefs)
  }
  Mathe_LK =  prob_LK()
  
  

Datensatz = data.frame("ID" = 1:100, "Alter" = Alter, "Studienfach" = Studienfach, "Interesse an Mathe" = Int_M,
                       "Interesse an Programmieren" = Int_P, "Mahte-LK" = Mathe_LK)
write.csv(Datensatz, file = "Datensatz.csv", row.names = FALSE)

return(Datensatz)
}

Students()

