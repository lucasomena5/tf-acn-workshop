############################################# LUCAS OMENA #############################################

# Variáveis primitivas:
## String: sequência de caracteres representando algum texto
## Number: um valor numérico, podendo ser representado por inteiro ou fracionado
## Bool: valor condicional lógico (true ou false)
## Null: valor vazio representado por null sem aspas


# Coleções de Variáveis:
## List/Turple: representado por valores entre chaves ‘[ ]’ separados por vírgula
## Map: representado por um par de chave/valor entre colchetes ‘{ }’

# https://www.terraform.io/language/values/variables

#######################################################################################################

variable "region" {
  type = string
  default = ""
}

variable "role_arn" {
  type = string
  default = ""
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = null
}