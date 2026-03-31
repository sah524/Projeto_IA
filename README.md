# 🧩 Logic Puzzle Solver: O Enigma dos Meninos (Prolog)

Este projeto apresenta uma solução computacional para um quebra-cabeça de lógica complexo, desenvolvido como parte da disciplina de **Inteligência Artificial**. O sistema utiliza o motor de inferência declarativo do **Prolog** para encontrar a única combinação possível que satisfaz todas as 22 restrições do enunciado.

---

## ✨ Destaques do Projeto

* **Solução Única:** O modelo foi refinado para garantir que o quebra-cabeça esteja totalmente restringido, resultando em apenas uma saída válida.
* **Performance Otimizada:** Implementamos a técnica de **Redução do Espaço de Busca**, organizando as restrições fixas e filtros no topo do código para evitar o retrocesso (backtracking) desnecessário.
* **Auditoria por Backtracking:** O uso estratégico do predicado `fail` ao final do processo de busca garante que o Prolog explore todo o universo de possibilidades antes de confirmar a solução.

---

## 🚀 Como Executar

Para rodar este projeto, é necessário ter o ambiente **SWI-Prolog** instalado.

1.  Abra o SWI-Prolog.
2.  Carregue o arquivo do código (Ex: `File > Consult...` ou `?- [nome_do_arquivo].`).
3.  No console, execute o comando de entrada:
    ```prolog
    ?- main.
    ```
4.  O programa exibirá a tabela formatada com os resultados, o tempo exato de execução e a mensagem de finalização da busca.

---

## 🧠 Arquitetura e Lógica

O projeto explora os pilares fundamentais da programação lógica:

* **Unificação e Átomos:** Uso de átomos protegidos (ex: `'3_ou_mais'`) para tratar dados que iniciam com numerais, garantindo a integridade sintática.
* **Recursividade:** Implementação do predicado `alldifferent/1` para validação de unicidade em listas de características (Mochilas, Nomes, Sucos, etc.).
* **Conectivos Lógicos:** Modelagem precisa de regras de vizinhança e posicionamento relativo utilizando conjunções (`,`) e disjunções (`;`).
* **Modularização:** Separação clara entre a Base de Conhecimento (Fatos), o Motor de Busca (Modelo) e a Interface de Saída (Main).

---

## 👥 Equipe de Desenvolvimento

Este projeto foi realizado por alunos da **Universidade Católica de Brasília (UCB)**:

* 👤 **Sarah Silva**
* 👤 **Andressa Maria**
* 👤 **Tais Barbosa**
* 👤 **Lia Costa**
  
--- 

**Professor:** William Malvezzi

**Disciplina:** Inteligência Artifial I

---

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Prolog (SWI-Prolog v9.x)
* **Paradigma:** Declarativo / Lógico
* **Ferramentas:** PceEmacs / VS Code

