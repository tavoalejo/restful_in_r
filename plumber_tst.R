setwd("~/Google Drive/MCIC - I/APP_CLOUD/TAREAS/RESTFUL IN R")
hurtos<-read.csv('hurtos_bikes.csv');
SUCCESS_RESULT="<result>success</result>";
FAILURE_RESULT="<result>failure</result>";

Sys.setlocale('LC_ALL','C');
s=nrow(hurtos);
locn=0;


#' Funci??n para ejecutar el GET COMPLETO, es decir
#' que retorne la totalidad de los datos del dataframe
#' @get /hurtos
function(){
  list(datos_hurtos=hurtos)
}

#' buscar el registro
#' @get /registro/<fila>
function(fila){

  indices<-0
  
      list(id= fila, loc=hurtos[fila,1],upz=hurtos[fila,2],ene=hurtos[fila,3],feb=hurtos[fila,4],mar=hurtos[fila,5],abr=hurtos[fila,6],may=hurtos[fila,7],jun=hurtos[fila,8],jul=hurtos[fila,9],ago=hurtos[fila,10],sep=hurtos[fila,11])
  }

#' buscar el registro
#' @delete /registro/<locn>
function(locn){
  if(locn<=s){
  hurtos<-hurtos[-c(locn),]
  list(SUCCESS_RESULT) 
  }
  else
    list(FAILURE_RESULT) 
  
}



#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", s, "'"))
}
