library(googleComputeEngineR)


# Secci??n de configuracion----------------------------
proyecto <- "tavoalejoapcl"
zona<- "us-east1-b"
clave<- "tavoalejoapcl_key.json"

# Se deben definir el iD del proyecto (diferente a nombre de proyecto.)
# La zona en la cual se ubicar?? el R-SERVER, ver todas las posibles zonas que GCloud permite
# La clave obtenida en  la seccion credenciales de Google Cloud


# Definici??n de un ambiente de trabajo
Sys.setenv(GCE_AUTH_FILE = clave,
           GCE_DEFAULT_PROJECT_ID= proyecto,
           GCE_DEFAULT_ZONE=zona)

options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/cloud-platform")

#Autenticaci??n en Google cloud
gce_auth()

# Definir el proyecto
gce_global_project(proyecto)
gce_global_zone(zona)

default_project<- gce_get_project("tavoalejoapcl")
default_project$name

# Crear la m??quina virtual---------------------------------------

mv <- gce_vm(template="rstudio",
             name="rstudio-tavoalejo",
             username="tavoalejo",
             password="c3poyr2d2",
             predefined_type="n1-highmem-2")

