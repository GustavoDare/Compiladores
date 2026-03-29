# Construção de Compiladores - UFSCar

Este repositório contém a implementação dos trabalhos práticos da disciplina de Construção de Compiladores, ministrada pelo prof. Daniel Lucrédio no Departamento de Computação da Universidade Federal de São Carlos (UFSCar).

O objetivo principal do projeto é construir um compilador completo para a **Linguagem Algorítmica (LA)**, idealizada pelo prof. Jander Moreira. O compilador é desenvolvido em **Java** utilizando a ferramenta **ANTLR4** para a geração dos analisadores léxico e sintático.

## Autor

* **Gustavo Borguetti Daré** - RA: 818723

---

## Estrutura do Repositório

O desenvolvimento do compilador é dividido em etapas parciais, acumulando funcionalidades a cada novo trabalho entregue:

* **[T1] Analisador Léxico:** Leitura do código-fonte em LA e tokenização, reportando erros léxicos (símbolos não identificados, comentários/cadeias não fechadas).
* **[T2] Analisador Sintático:** *[Em breve]* Verificação estrutural dos tokens gerados, garantindo que o código segue as regras da gramática da linguagem LA.
* **[T3] Analisador Semântico:** *[Em breve]* Verificação de coerência de tipos, declaração de variáveis, escopo e regras de negócio da linguagem.
* **[T4] Gerador de Código:** *[Em breve]* Tradução do código-fonte LA validado para a linguagem alvo (C).
* **[T5] Compilador Completo:** *[Em breve]* Integração de todas as fases e refinamento final.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

* **Linguagem Base:** Java 11 (ou superior)
* **Gerador de Parsers:** ANTLR 4.13.1
* **Gerenciador de Dependências:** Apache Maven 3.6+

---

## 🚀 Como Compilar e Executar

Cada trabalho (T1 ao T5) está estruturado como um projeto Maven independente dentro de sua respectiva pasta. 

Para compilar qualquer um dos analisadores, siga os passos abaixo:

### 1. Compilação
Navegue pelo terminal até a pasta do trabalho desejado (ex: `cd T1/meu_compilador`) e execute o comando do Maven:

```bash
mvn clean package
