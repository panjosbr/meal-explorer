# 🍽️ Meal Explorer: Clean Architecture em Flutter

Este projeto é um _boilerplate_ educacional desenvolvido em Flutter, idealizado para demonstrar a implementação completa da **Clean Architecture** (Arquitetura Limpa) em um aplicativo de receitas.

O **Meal Explorer** simula um ambiente de aplicação real, interagindo com uma API externa [TheMealDB](https://www.themealdb.com/api.php) e gerenciando dados localmente para favoritos.

---

## 🌟 Features do Aplicativo

O **Meal Explorer** oferece as seguintes funcionalidades principais ao usuário:

- **Busca de Receitas por Nome:** O usuário pode pesquisar receitas utilizando a API TheMealDB.
- **Listagem de Resultados:** Exibição de _previews_ das receitas com nome e foto.
- **Detalhes da Receita:** Visualização completa da receita, incluindo nome, imagem, **ingredientes** e o **passo a passo** das instruções.
- **Gestão de Favoritos:** Capacidade de salvar receitas favoritas para acesso rápido e offline.
- **Acesso Offline:** Listagem das receitas favoritas salvas localmente.
- **Receita Aleatória:** Carregamento de uma receita aleatória.

---

## 🧠 O Que Você Pode Aprender

O valor principal deste projeto reside nas tecnologias e padrões de arquitetura utilizados:

### 1. Clean Architecture e Separação de Camadas

- **Domain (Coração):** Implementação de regras de negócio pura, isolada de qualquer framework.
- **Data (Implementação):** Uso de **Interfaces/Contratos** para Repositórios e Data Sources, separando API (Remoto) e Cache (Local).
- **Presentation (Display):** Gerenciamento de estado com Cubit, que se comunica apenas com os Use Cases.

### 2. Padrões de Programação Funcional em Dart

- **Dartz (`Either`):** Uso do `Left/Right` para representar explicitamente Falha (`Failure`) e Sucesso em todas as chamadas assíncronas (Repository e Use Cases).
- **Equatable:** Utilizado na Camada Domain para criar **Entidades (Value Objects)** imutáveis e garantir a comparação baseada em valor.

### 3. Gerenciamento de Estado e Fluxo de Dados

- **Cubit/BLoC:** Demonstração do fluxo de dados unidirecional (UI → Cubit → Use Case → Repository).
- **Testes de Cubit:** Uso de `bloc_test` e `mocktail` para garantir que o gerenciamento de estado e as transições sejam testados isoladamente.

### 4. Tratamento Robusto de Dados e Erros

- **HTTP e Exceptions:** Implementação de Data Sources para chamadas de API.
- **Tratamento de Exceções:** Lançamento de exceções específicas na Camada Data e mapeamento para `Failure` no Repository.
- **Persistência Local:** Uso do `shared_preferences` para armazenamento de dados offline (Favoritos), incluindo a serialização manual de objetos complexos (JSON).

---

## 🛠️ Tecnologias Utilizadas

| Categoria         | Pacote/Ferramenta       | Finalidade                              |
| :---------------- | :---------------------- | :-------------------------------------- |
| **Arquitetura**   | Clean Architecture      | Design Pattern Principal                |
| **Estado**        | `flutter_bloc`, `cubit` | Gerenciamento de Estado da Presentation |
| **Funcional**     | `dartz`                 | Tratamento de Sucesso/Falha (Either)    |
| **Imutabilidade** | `equatable`             | Entidades Imutáveis                     |
| **Comunicação**   | `http`                  | Requisições HTTP (Remoto)               |
| **Cache Local**   | `shared_preferences`    | Armazenamento de Favoritos              |
| **Testes**        | `mocktail`, `bloc_test` | Mocks e Testes de Cubit                 |

---

## 🚀 Como Rodar o Projeto

1. Instale as dependências:

   ```sh
   flutter pub get
   ```

2. Execute o projeto:
   ```
   flutter run
   ```

## Estrutura do projeto

- `lib/` - Código principal do app.
- `packages/core_components/` - Componentes visuais reutilizáveis (botões, campos, cartões, etc).
- `assets/` - Imagens e recursos estáticos.
